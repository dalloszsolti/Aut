class AddTopicIdTomComments < ActiveRecord::Migration
  def up
   add_column :comments, :topic_id, :string
  end

  def down
  end
end
