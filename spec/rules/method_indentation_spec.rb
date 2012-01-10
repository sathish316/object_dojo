require File.dirname(__FILE__) + '/../spec_helper'

describe MethodIndentation do
  let(:rule) {MethodIndentation.new(2)}
  
  it "should be invalid if level of indentation is more than 2" do
    rule.should_not be_valid <<-CODE
      def foo
        bars.each do |bar|
          bazs.each do |baz|
            bar * baz
          end
        end
      end
    CODE
  end
  
  it "should be valid if level of indentation is 2" do
    rule.should be_valid <<-CODE
      def foo
        bars.each do |bar|
          bar * bar
        end
      end
    CODE
  end

  it "should be valid if level of indentation is 0" do
    rule.should be_valid <<-CODE
      def foo
        foos.first
      end
    CODE
  end

  it "should be valid if level of indentation is 0 with multiple methods" do
    rule.should be_valid <<-CODE
      def foo
        foos.first
      end
      
      def bar
        bars.first
      end
    CODE
  end

  it "should be invalid if level of indentation is more than 2 with multiple methods" do
    rule.should_not be_valid <<-CODE
      def foo
        bars.each do |bar|
          bazs.each do |baz|
            bar * baz
          end
        end
      end
      
      def bar
        bars.first
      end
    CODE
  end
end