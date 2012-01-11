class FirstClassCollections
  def initialize(max)
    @max = max
  end
  
  def valid?(code)
    ClassStructure.new(code).collection_count <= 1
  end

  def message
    "more than 1 collection member variable"
  end    
end