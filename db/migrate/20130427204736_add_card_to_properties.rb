class AddCardToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :card_id, :integer
  end
end
