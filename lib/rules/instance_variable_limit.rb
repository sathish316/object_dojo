class InstanceVariableLimit
  
  def initialize(max)
    @max = max
  end
  
  def valid?(code)
    class_structure = ClassStructure.new(code)
    class_structure.instance_variables.size <= @max
  end
end