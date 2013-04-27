class RenameProperties < ActiveRecord::Migration
  def up
  	rename_column :properties, :value, :v
  	rename_column :properties, :key, :k
  end

  def down
  	rename_column :properties, :v, :value
  	rename_column :properties, :k, :key
  end
end
