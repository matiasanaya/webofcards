class AddPrivacyToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :privacy, :string
  end
end
