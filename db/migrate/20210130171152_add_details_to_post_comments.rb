class AddDetailsToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :post_comment, :text
  end
end
