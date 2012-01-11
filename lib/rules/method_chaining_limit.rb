class MethodChainingLimit
  def initialize(max)
    @max = max
  end
  
  def valid?(code)
    code.gsub(/\d+\.\d+/,'').split("\n").all? do |line|
      line.count('.') <= 1
    end
  end
end