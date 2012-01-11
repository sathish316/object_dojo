require 'spec_helper'

describe FirstClassCollections do
  let(:rule) {FirstClassCollections.new(1)}

  it "should be invalid if there is more than 1 collection" do
    ClassStructure.any_instance.stubs(:collection_count).returns(2)
    rule.should_not be_valid <<-CODE
      @foo = []
      @bar = []
    CODE
  end

  it "should be valid if there is <= 1 collection" do
    ClassStructure.any_instance.stubs(:collection_count).returns(1)
    rule.should be_valid <<-CODE
      @foo = [1,2,3]
    CODE
  end
end