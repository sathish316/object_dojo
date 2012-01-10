require File.dirname(__FILE__) + '/../spec_helper'

describe InstanceVariableLimit do
  let(:rule) {InstanceVariableLimit.new(2)}
  
  it "should be invalid if limit is exceeded" do
    rule.should_not be_valid <<-CODE
      class Foo
        def initialize(x,y,z)
          @x = x
          @y = y
          @z = @x * @y
        end
      end
    CODE
  end
  
  it "should be valid if limit is not exceeded" do
    rule.should be_valid <<-CODE
      class Foo
        def initialize(x,y,z)
          @x = x
          @y = y
        end
        
        def perimeter
          @x + @y
        end
      end
    CODE
  end
end