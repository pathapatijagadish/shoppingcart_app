class RenameColumnToProducts < ActiveRecord::Migration
  def up
  	rename_column :products,:categorie_id,:category_id
  end

  def down
  end
end
