class ClassStructure
  def initialize(code)
    @code = code
  end
  
  def instance_variables
    @code.scan(/\@\w+/).map {|name| name.sub('@','')}.uniq
  end
  
  def method_names
    @code.scan(/def \w+/).map {|name| name.sub('def ','')}.uniq
  end
  
  def has_accessor_method?
    all_instance_variables = instance_variables
    method_names.any? {|method_name| instance_variables.include?(method_name.gsub('=',''))}
  end
  
  def line_count
    @code.split("\n").reject{|line| line.strip.size==0}.size
  end
  
  def collection_count
    @code.scan(/\@\w+\s*\=\s*(\[.*?\]|\{.*?\}|Array\.new|Set\.new|Hash\.new)/).size
  end
end