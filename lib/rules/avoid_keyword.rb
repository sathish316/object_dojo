class AvoidKeyword
  def initialize(keyword)
    @keyword = keyword
  end
  
  def valid?(code)
    !code.include?(@keyword)
  end
end