# Common IRBRC

require 'bigdecimal'

# Widen pp so it isn't as tall
def pp(printee, width = 140)
  PP.pp(printee, $>, width); nil
end

# Works in REE and 1.9+
class Method
  def sublimate
    if self.respond_to? :source_location
      file, line = self.source_location
    elsif self.respond_to?(:__file__) && self.respond_to?(:__line__)
      file = self.__file__
      line = self.__line__
    else
      raise "I don't know how to find the file/line of this method definition in the current ruby."
    end
    method_line = "#{file}:#{line}"
    puts method_line
    %x(subl -n #{method_line})
  end
end

# Nicer to read BigDecimal inspects (sort of objective-c-ish)
class BigDecimal
  def inspect
    "@(#{self.to_s})"
  end
end
