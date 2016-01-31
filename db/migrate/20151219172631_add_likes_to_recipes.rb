class AddLikesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :thumbs_up, :integer
  end
end
