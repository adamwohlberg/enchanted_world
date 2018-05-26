class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ip_address

      t.timestamps null: false
    end
    add_column :businesses, :user_id, :string
  end
end
