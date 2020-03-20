class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :api ]
  before_action :find_recipe, only: [ :index, :api ]

  def index
    recipe_params = []
    Recipe.all.each do |recipe|
      recipe_params << [ recipe.carbs, recipe.fat, recipe.protein ] if recipe.category != @recipe.category
    end
    index = Ngt::Index.new(3)
    index.batch_insert(recipe_params)
    query = recipe_params[@recipe.id]
    @result = index.search(query, size: 3)
    @recipes = [ @recipe, Recipe.find(@result[1][:id]), Recipe.find(@result[2][:id]) ]
  end

  def api
    @recipe = Recipe.find(params[:query])
    render json: @recipe
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:query])
  end
end
