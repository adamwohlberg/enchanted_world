class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table "businesses", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "yelp_id"
      t.string "name"
      t.decimal "latitude"
      t.decimal "longitude"
      t.decimal "rating"
      t.string "price"
      t.integer "review_count"
      t.string "image_url"
      t.string "category"
      t.string "location"
      t.string "meta_category"
      t.integer "search_id"
      t.decimal "distance"
      t.string "yelp_url"
      t.string "search_type"
      t.string "remote_ip"
    end
  end
end
