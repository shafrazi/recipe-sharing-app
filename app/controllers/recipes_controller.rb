class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    #code
  end

  def show
    @recipe = Recipe.find(params[:id])
    #code
  end
end
