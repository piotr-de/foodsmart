class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :api ]

  def index
    if !params[:protein].nil? && params[:protein].present?
      @recipes = Recipe.where("protein > ?", params[:protein]).first(5)
    else
      @recipes = Recipe.first(5)
    end
  end

  def api
    @recipe = Recipe.find(params[:query])
    render json: @recipe
  end
end
