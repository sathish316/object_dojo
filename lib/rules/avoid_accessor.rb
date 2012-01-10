class AvoidAccessor
  def valid?(code)
    class_structure = ClassStructure.new(code)
    code !~ /attr_(reader|writer|accessor)/ && !class_structure.has_accessor_method?
  end
end