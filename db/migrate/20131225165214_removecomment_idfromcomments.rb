class RemovecommentIdfromcomments < ActiveRecord::Migration
  def up
  remove_column :comments, :comment_id
  end

  def down
  end
end
