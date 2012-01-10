require File.dirname(__FILE__) + '/../spec_helper'

describe AvoidAccessor do
  let(:rule) {AvoidAccessor.new}
  
  it "should be valid if there are no accessors" do
    rule.should be_valid <<-CODE
      class Foo
        def initialize(x,y)
          @x = x
          @y = y
        end
      end
    CODE
  end
  
  it "should be invalid if attr_reader is used" do
    rule.should_not be_valid <<-CODE
      class Foo
        attr_reader :x
        def initialize(x)
          @x = x
        end
      end
    CODE
  end
  
  it "should be invalid if attr_writer is used" do
    rule.should_not be_valid <<-CODE
      class Foo
        attr_writer :x
        def initialize(x)
          @x = x
        end
      end
    CODE
  end
  
  it "should be invalid if attr_accessor is used" do
    rule.should_not be_valid <<-CODE
      class Foo
        attr_accessor :x
        def initialize(x)
          @x = x
        end
      end
    CODE
  end
  
  it "should be invalid if getter is used" do
    rule.should_not be_valid <<-CODE
      class Foo
        def initialize(value)
          @value = value
        end
        
        def value
          @value
        end
      end
    CODE
  end
  
  it "should be invalid if writer is used" do
    rule.should_not be_valid <<-CODE
      class Foo
        def initialize(value)
          @value = value
        end
        
        def value=(value)
          @value = value
        end
      end
    CODE
  end
  
end