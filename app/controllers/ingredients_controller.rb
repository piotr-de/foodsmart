class IngredientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    url = "https://api.edamam.com/api/food-database/parser?app_id=#{ENV['EDAMAM_APP_ID']}&app_key=#{ENV['EDAMAM_API_KEY']}&ingr=#{params[:query]}&health=vegan"
    json = RestClient.get(url)
    results = JSON.parse(json)
    @ingredients = []
    results["hints"].each do |result|
      ingredient = Ingredient.new({
        name: result["food"]["label"],
        energy: result["food"]["nutrients"]["ENERC_KCAL"],
        carbs: result["food"]["nutrients"]["CHOCDF"],
        fat: result["food"]["nutrients"]["FAT"],
        protein: result["food"]["nutrients"]["PROCNT"],
        fibre: result["food"]["nutrients"]["FIBTG"]
      })
      @ingredients << ingredient if ingredient.valid?result
    end
  end
end
