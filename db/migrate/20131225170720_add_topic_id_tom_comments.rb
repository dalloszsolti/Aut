class AddTopicIdTomComments < ActiveRecord::Migration[7.0]
  def up
   add_column :comments, :topic_id, :string
  end

  def down
  end
end
