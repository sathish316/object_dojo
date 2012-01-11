class AvoidKeyword
  def initialize(keyword)
    @keyword = keyword
  end
  
  def valid?(code)
    !code.include?(@keyword)
  end
  
  def message
    "uses #{@keyword} keyword"
  end
end