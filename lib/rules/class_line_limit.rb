class ClassLineLimit
  def initialize(max)
    @max = max
  end
  
  def valid?(code)
    ClassStructure.new(code).line_count <= @max
  end
  
  def message
    "is longer than #{@max} lines"
  end
end