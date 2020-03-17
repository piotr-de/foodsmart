class IngredientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    url = "https://api.edamam.com/api/food-database/parser?app_id=#{ENV['EDAMAM_APP_ID']}&app_key=#{ENV['EDAMAM_API_KEY']}&ingr=#{params[:query]}"
    json = RestClient.get(url)
    results = JSON.parse(json)
    @ingredients = results
  end
end
