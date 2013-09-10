require 'spec_helper'

describe "Collection" do
  
  describe "Index" do 
    
    it "visiting the index page works" do
      visit collections_path
      current_path.should eq(collections_path)
    end
    
  end

  describe "Create" do

    it "click new link to add collection" do
      visit collections_path      
      click_link "Add Collection"
      fill_in "collection_name",     with: "Test Collection"
      fill_in "collection_material",  with: "test material"
      fill_in "collection_collection_description",  with: "test description"
      click_button "Create Collection"
      response.body.should include("Test Collection")
    end
  end

end