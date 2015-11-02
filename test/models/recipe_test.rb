require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup 
    @chef = Chef.create(name: "bob", email: "bob@bobby.com")
    @recipe = @chef.recipes.build(name:"chicken hat", summary: "this is ha food and ha hat", description:"what you gonna do when they come for you chicken hat chicken hat")
  end
  
  test "Recipe should be valid" do 
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
    
  end
  
  test "name should not be too long" do 
    
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
    
  end
  
  test "name lenghth should not be too short " do
    
   @recipe.name = "aaaa"
   assert_not @recipe.valid?
    
  end
  
  test "Summary must be present" do
    
    @recipe.summary=""
    assert_not @recipe.valid?
    
  end
  
  test "Summary lenght must not be too long" do 
    
     @recipe.summary = "a" * 151
    assert_not @recipe.valid?
    
  end
  
  test "Summary length should not be too short" do
    
     @recipe.name = "aaa"
    assert_not @recipe.valid?
    
  end
  
  test "description must be present" do
    
    @recipe.description=""
    assert_not @recipe.valid?
    
    
  end
  
  test "description must not be too long " do
    
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
    
  
  end
  
  test "Desription must not be too short" do 
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end 
end