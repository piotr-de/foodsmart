class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :api ]

  def index
    @recipes = Recipe.all
  end

  def api
    @recipe = Recipe.find(params[:query])
    render json: @recipe
  end
end
