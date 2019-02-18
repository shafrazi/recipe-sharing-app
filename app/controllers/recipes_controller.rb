class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    #code
  end
end
