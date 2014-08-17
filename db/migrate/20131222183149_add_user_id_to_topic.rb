class AddUserIdToTopic < ActiveRecord::Migration
  def change
  rename_column :Topics, :opened_by, :user_id
  end
end
