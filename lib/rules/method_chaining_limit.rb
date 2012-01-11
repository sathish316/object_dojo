class MethodChainingLimit
  def initialize(max)
    @max = max
  end
  
  def valid?(code)
    code.gsub(/\d+\.\d+/,'').split("\n").all? do |line|
      line.count('.') <= @max
    end
  end
  
  def message
    "more than one dot per line"
  end
end