require 'spec_helper'

describe MethodChainingLimit do
  
  let(:rule) {MethodChainingLimit.new(1)}
  
  it "should be valid if there is 1 dot per line" do
    rule.should be_valid <<-CODE
      foo.bar
      bar.baz
      baz.foo
    CODE
  end
  
  it "should be invalid if there are more than 1 dots per line" do
    rule.should_not be_valid <<-CODE
      foo
      foo.bar
      bar.baz.foo
    CODE
  end

  it "should ignore decimals and count only method chaining" do
    rule.should be_valid <<-CODE
      foo.bar = 5.67
    CODE
  end
end