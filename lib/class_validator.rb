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
    [AvoidAccessor.new, AvoidKeyword.new('else'), ClassLineLimit.new(50),
      InstanceVariableLimit.new(2), MethodIndentation.new(2), MethodChainingLimit.new(1)]
  end
end