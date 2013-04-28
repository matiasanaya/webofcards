class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :card_id
      t.string :code
      t.string :password_digest

      t.timestamps
    end
  end
end
