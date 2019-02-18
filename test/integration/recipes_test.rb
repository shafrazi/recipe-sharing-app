require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chef = Chef.create(name: "test", email: "test@example.com")
    @recipe1 = @chef.recipes.create(name: "test", description: "example recipe")
    @recipe2 = @chef.recipes.create(name: "test2", description: "example recipe2")
    #code
  end

  test "should get recipes index" do
    get recipes_url
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_url
    assert_template "recipes/index"
    assert_match @recipe1.name, response.body
    assert_match @recipe2.name, response.body
  end

end
