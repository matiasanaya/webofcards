class RenameTableProperties < ActiveRecord::Migration
  def up
  	rename_table :properties, :props
  end

  def down
  	rename_table :props, :properties
  end
end
