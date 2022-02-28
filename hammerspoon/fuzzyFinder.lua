Matrix = {}

function Matrix:new(width, height)
  m = {
    width = width,
    height = height,
    data = {}
  }

  setmetatable(m, self)
  self.__index = self
  return m
end

function Matrix:set(x, y, value)
  self.data[y * self.width + x] = value
end

function Matrix:get(x, y, default)
  return self.data[y * self.width + x] or default
end

function fuzzyQueryDP(text, query)
  if #query > #text then return nil end

  scores = Matrix:new(text:len(), query:len())

  for qIndex=1, #query do
    max = nil
    maxIndex = 1

    for tIndex=qIndex, #text do
      t = text:sub(tIndex, tIndex)
      q = query:sub(qIndex, qIndex)

      -- print("looking at t='" .. t .. "' q='" .. q .. "' index=" .. tIndex)

      if t == q then
        max = max or -100
        previous = scores:get(tIndex - 1, qIndex - 1, {score = 0, max = 0, maxIndex = tIndex-1})

        if previous.max == nil then
          goto continue
        end

        gap = tIndex - previous.maxIndex - 1
        score = previous.max + 1 - gap
        if score >= max then
          maxIndex = tIndex
        end
        max = math.max(max, score)

        scores:set(tIndex, qIndex, {score = score, max = max, maxIndex = maxIndex})
      else
        scores:set(tIndex, qIndex, {score = nil, max = max, maxIndex = maxIndex})
      end
      ::continue::
    end

    if max == nil then
      return nil
    end
  end

  globalMax = nil
  for tIndex=#query, #text do
    score = scores:get(tIndex, #query)
    -- print("getting score=" .. (score.score or "nil") .. " max=" .. score.max .. " maxIndex=" .. maxIndex)

    if score ~= nil and score.score ~= nil then
      -- print("we got score " .. score.score)
      if globalMax == nil then
        globalMax = score.score
      else
        globalMax = math.max(globalMax, score.score)
      end
    end
  end

  return globalMax
end

print(fuzzyQueryDP("hello", "elle"))

print(fuzzyQueryDP("source/test/regression/graph.swift", "string"))
print(fuzzyQueryDP("source/string.swift", "string"))
print(fuzzyQueryDP("str/testing.swift", "string"))
print(fuzzyQueryDP("calendar microsoft outlook", "docker"))
print(fuzzyQueryDP("how to set resource limits for a process with systemd in centos/rhel 7 and 8 - the geek diary google chrome", "docker"))

--[[
  s  o  u  r  c  e  /  s  t  r  i  n  g  .  s  w  i  f  t
s 1                    1                    1
t                         2                            -1
r                            3
i                               4                 -2
n                                  5
g                                     6

  s  o  u  r  c  e  /  s  t  r  i  n  g  .  s  w  i  f  t
s 1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1
t 0  0  0  0  0  0  0  0  2  2  2  2  2  2  2  2  2  2  2
r 0  0  0  0  0  0  0  0  0  3  3  3  3  3  3  3  3  3  3
i 0  0  0  0  0  0  0  0  0  0  4  4  4  4  4  4  4  4  4
n                                  5  5  5  5  5  5  5  5
g                                     6  6  6  6  6  6  6
]]--
