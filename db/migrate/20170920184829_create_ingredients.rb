class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end



def create
  indredient = Inged.new(stuff)
  @recipe = Recipe.find(4)

  if @ingredient.save
    @recipe.ingredients << ingredient

end