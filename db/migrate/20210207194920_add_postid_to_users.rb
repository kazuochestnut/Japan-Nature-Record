class AddPostidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :post_id, :integer
  end
end
