class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end