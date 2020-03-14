class RecipesController < ApplicationController
  require 'matplotlib/pyplot'
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    plt = Matplotlib::Pyplot
    plt.plot(1, 2)
    @data = JSON.parse(File.read("python/recipes/pizza_0_to_99.json"))
  end
end
