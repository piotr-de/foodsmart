class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @recipes
  end
end
