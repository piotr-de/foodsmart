class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @recipes = JSON.parse(File.read("python/recipes/pizza_100_to_199.json"))
    # render json: @recipes
  end
end
