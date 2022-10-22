class AddUserIdToTopic < ActiveRecord::Migration[7.0]
  def change
  rename_column :Topics, :opened_by, :user_id
  end
end
