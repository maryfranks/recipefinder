class Recipe < ActiveRecord::Base

  def self.get_recipes(url)
    response = HTTParty.get(url).body
    JSON.parse(response)
  end

end
