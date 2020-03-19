class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :api ]

  def index
    if !params[:protein].nil? && params[:protein].present?
      @recipes = Recipe.where("protein > ?", params[:protein]).first(5)
    else
      recipe_params = []
      Recipe.first(10).each do |recipe|
        recipe_params << [ recipe.energy, recipe.carbs, recipe.fat, recipe.protein ]
      end
      index = Ngt::Index.new(4)
      index.batch_insert(recipe_params)
      query = recipe_params[0]
      @result = index.search(query, size: 3)
      @recipes = Recipe.first(5)
    end
  end

  def api
    @recipe = Recipe.find(params[:query])
    render json: @recipe
  end
end
