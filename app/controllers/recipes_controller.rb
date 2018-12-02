class RecipesController < ApplicationController

  def index
    @recipes = Recipe.get_recipes("https://www.food2fork.com/api/search?key=da315bf80dd50622e37f1677756d0a3d&q=chocolate")["recipes"]
  end

end
