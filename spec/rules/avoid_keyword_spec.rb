require File.dirname(__FILE__) + '/../spec_helper'

describe AvoidKeyword do
  let(:rule) {AvoidKeyword.new('else')}
  
  it "should be invalid if keyword used in code" do
    rule.should_not be_valid <<-CODE
      if dojo
        :code
      else
        :play_games
      end
    CODE
  end
  
  it "should be valid if keyword is not used in code" do
    rule.should be_valid <<-CODE
      return :code if dojo
      :play_games
    CODE
  end
end