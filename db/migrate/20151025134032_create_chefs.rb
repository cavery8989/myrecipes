class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
