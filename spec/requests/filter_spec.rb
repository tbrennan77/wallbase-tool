require 'spec_helper'

describe "Filter" do
  
  describe "HomePage" do 
    
    it "visiting the home page works" do
      visit root_path
      current_path.should eq(root_path)
    end
    
  end

end