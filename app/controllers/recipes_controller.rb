class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @data = JSON.parse(File.read("python/recipes/pizza_0_to_99.json"))
  end
end
