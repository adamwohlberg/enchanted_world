class AddOptionsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :search_type, :string, :default => 'unicorns'
  end
end
