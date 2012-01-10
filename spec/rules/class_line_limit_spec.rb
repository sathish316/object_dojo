require File.dirname(__FILE__) + '/../spec_helper'

describe ClassLineLimit do
  let(:rule) {ClassLineLimit.new(5)}

  it "should be valid if max length is not exceeded" do
    rule.should be_valid <<-CODE
      class Foo

        def initialize(bar)
          @bar = bar
        end

      end
    CODE
  end
  
  it "should be invalid if max length is exceeded" do
    rule.should_not be_valid <<-CODE
      class Foo
        def initialize(bar, baz)
          @bar = bar
          @baz = baz
        end
      end
    CODE
  end
end