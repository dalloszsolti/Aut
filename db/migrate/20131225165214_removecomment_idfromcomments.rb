class RemovecommentIdfromcomments < ActiveRecord::Migration[7.0]
  def up
  remove_column :comments, :comment_id
  end

  def down
  end
end
