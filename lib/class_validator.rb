class ClassValidator
  def initialize(file)
    @file = file
    @code = File.open(file).read
  end
  
  def validate
    rules.each do |rule|
      unless rule.valid?(@code)
        puts "#{@file}:#{rule.message}"
      end
    end
  end
  
  private
  
  def rules
    [
      MethodIndentation.new(3),
      AvoidKeyword.new('else'),
      AvoidKeyword.new('elsif'),
      FirstClassCollections.new(1),
      MethodChainingLimit.new(1),
      ClassLineLimit.new(50),
      InstanceVariableLimit.new(2),
      AvoidAccessor.new
    ]
  end
end