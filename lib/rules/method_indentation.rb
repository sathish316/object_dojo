class MethodIndentation
  TABS = 2
  
  def initialize(max_level)
    @max_level = max_level
  end
  
  def valid?(method)
    max_indent(method) <= @max_level
  end
  
  def message
    "indentation is more than #{@max_level} levels"
  end
  
  private
  
  def max_indent(code)
    indents = code.split("\n").collect do |line|
      match = line.match(/^(\s*)/)
      match ? match[1].length/TABS : 0
    end
    indents.max - indents.min
  end
end