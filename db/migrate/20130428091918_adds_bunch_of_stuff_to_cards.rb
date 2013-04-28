class AddsBunchOfStuffToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :desc, :text
  	add_column :cards, :typ, :string
  end
end
