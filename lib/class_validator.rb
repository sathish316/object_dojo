class ClassValidator
  def initialize(file, options={})
    @file = file
    @options = options
  end
  
  def validate
    code = File.open(@file).read
    rules.each do |rule|
      next if rule.valid?(code)
      puts "#{@file}: #{rule.message}"
    end
  end
  
  private
  
  def rules
    options = @options
    [
      MethodIndentation.new(options['max_indent']),
      *options['avoid_keywords'].split(',').map {|keyword| AvoidKeyword.new(keyword)},
      FirstClassCollections.new(options['max_collections']),
      MethodChainingLimit.new(options['max_chaining']),
      ClassLineLimit.new(options['max_lines']),
      InstanceVariableLimit.new(options['max_instance_vars']),
      AvoidAccessor.new
    ]
  end
end