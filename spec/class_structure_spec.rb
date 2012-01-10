require 'spec_helper'

describe ClassStructure do
  describe "instance variables" do
    it "should return unique instance variable names" do
      class_structure = ClassStructure.new <<-CODE
        class Person
          def initialize(first, last)
            @first, @last = first, last
          end
          
          def to_s
            @first + @last
          end
        end
      CODE
      
      class_structure.instance_variables.sort.should == ['first', 'last']
    end
    
    it "should be empty if there are no instance variables" do
      class_structure = ClassStructure.new <<-CODE
        class Person
        end
      CODE
      class_structure.instance_variables.should be_empty
    end

    it "should not include class variables" do
      pending
      class_structure = ClassStructure.new <<-CODE
        class Person
          @@count = 0
        end
      CODE
      class_structure.instance_variables.should be_empty
    end
  end

  describe "method names" do
    it "should return unique method names" do
      class_structure = ClassStructure.new <<-CODE
        class Person
          def foo
          end
          
          def bar
          end
          
          def first
            @first
          end
          
          def last
            @last
          end
        end
      CODE
      
      class_structure.method_names.should == ['foo', 'bar', 'first', 'last']
    end
    
    it "should be empty if there are no methods" do
      class_structure = ClassStructure.new <<-CODE
        class Person
          attr_accessor :first, :last
        end
      CODE
      
      class_structure.method_names.should be_empty
    end
  end
  
  describe "has accessor method" do
    it "should be true if there are getter methods" do
      class_structure = ClassStructure.new <<-CODE
        class Person
          def name
            @name
          end
        end
      CODE
      
      class_structure.should have_accessor_method
    end
    
    it "should be true if there are setter methods" do
      class_structure = ClassStructure.new <<-CODE
        class Person
          attr_accessor :first, :last
          def name=(name)
            @name = name
          end
        end
      CODE
      
      class_structure.should have_accessor_method
    end
    
    it "should be false if there are no accessor methods" do
      class_structure = ClassStructure.new <<-CODE
        class Person
          def name
            @first + @last
          end
        end
      CODE
      
      class_structure.should_not have_accessor_method
    end
  end
end