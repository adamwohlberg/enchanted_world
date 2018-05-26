class AddToggleToUserSettings < ActiveRecord::Migration
  def change
    add_column :settings, :tawggle_on, :boolean, :default => false
  end
end
