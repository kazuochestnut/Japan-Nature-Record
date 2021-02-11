class CreatePosts < ActiveRecord::Migration[5.2]
  def change
     create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "image_id"
    t.text "description"
    t.string "shooting_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "location_id"
    t.integer "user_id"
  end
  end
end
