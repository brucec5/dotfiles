# Common IRBRC

require 'bigdecimal'

# Widen pp so it isn't as tall
def pp(printee, width = 140)
  PP.pp(printee, $>, width); nil
end

# Works in REE and 1.9+
module Sublimate
  def sublimate!
    if self.respond_to? :source_location
      file, line = self.source_location
      if file.nil? || line.nil?
        return puts "#{self.name} is a native method!"
      end
    elsif self.respond_to?(:__file__) && self.respond_to?(:__line__)
      begin
        file = self.__file__
        line = self.__line__
      rescue ArgumentError
        return puts "#{self.name} is a native method!"
      end
    else
      raise "I don't know how to find the file/line of this method definition in the current ruby."
    end
    method_line = "#{file}:#{line}"
    puts method_line
    %x(subl -n #{method_line})
  end
end

class Method
  include Sublimate
end

class UnboundMethod
  include Sublimate
end

class Object
  def sublimate(method_name)
    # self.method(method_name).sublimate!
    # Some assholes override `method` so the above doesn't work.
    # Mostly HTTP clients seem to do this.
    # I doubt they would override instance_method, though.
    self.class.instance_sublimate method_name
  end

  def instance_sublimate(method_name)
    self.instance_method(method_name).sublimate!
  end
end

# Nicer to read BigDecimal inspects (sort of objective-c-ish)
class BigDecimal
  def inspect
    "@(#{self.to_s})"
  end
end

class Fixnum
  def hex
    self.to_s(16)
  end
end

# My stupid git aliases that I sometimes type into irb on accident.
# Might as well have them do something useful.

def gs
  puts `git status`
end

def gd
  puts `git diff`
end
