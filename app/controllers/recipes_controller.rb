class RecipesController < ApplicationController

  def search
    base_url = ENV["FOOD2FORK_SERVER_AND_PORT"]
    key = "key=#{ENV["FOOD2FORK_KEY"]}"
    if params[:search] == nil
      search_term = "chocolate"
    else
      search_term = params[:search]
    end
    url = "#{base_url}#{key}&q=#{search_term}"
    @recipes = Recipe.get_recipes(url)["recipes"]
  end

end
