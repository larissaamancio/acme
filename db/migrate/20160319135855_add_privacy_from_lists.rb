class AddPrivacyFromLists < ActiveRecord::Migration
  def change
    add_column :lists, :privacy, :boolean
  end
end
