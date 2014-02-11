class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :discount
      t.integer :size
      t.string :color
      t.integer :user_id
      t.integer :categorie_id
      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps
    end
  end
end
