class CreateFoursquares < ActiveRecord::Migration
  def change
    create_table :foursquares do |t|
      t.integer :remote_id
      t.string :name
      t.string :phone
      t.string :address
      t.integer :lat
      t.integer :long
      t.float :rating
      t.integer :here_now
      t.text :tip
      t.string :short_url
      t.string :status

      t.timestamps
    end
  end
end
