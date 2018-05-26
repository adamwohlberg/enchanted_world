class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :user_id
      t.string :search_term
      t.timestamps null: false
    end
  end
end
