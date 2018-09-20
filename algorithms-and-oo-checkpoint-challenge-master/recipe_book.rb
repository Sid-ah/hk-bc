class RecipeBook
  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    # I need to finish this before I give Bernie the program...

    # The CSV file looks like this:
    # "id", "name", "description", "ingredients", "directions"

  end

  def find_recipe_by_id(recipe_id)
    recipes = []
    @recipes.each do |recipe|
      recipes << recipe if recipe.id == recipe_id
    end

    raise "Can't find a recipe with an id of #{recipe_id.inspect}" unless recipe
    recipes
  end
end
