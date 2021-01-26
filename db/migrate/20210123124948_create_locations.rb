class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name 
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
