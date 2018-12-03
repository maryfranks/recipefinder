class RecipesController < ApplicationController

  def index
    base_url = ENV["FOOD2FORK_SERVER_AND_PORT"]
    key = "key=#{ENV["FOOD2FORK_KEY"]}"
    search_term = "chocolate"
    url = "#{base_url}#{key}&q=#{search_term}"
    @recipes = Recipe.get_recipes(url)["recipes"]
  end

end
