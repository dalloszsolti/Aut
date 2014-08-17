class RemoveOpenedAtFromTopics < ActiveRecord::Migration
  def up
  remove_column :topics, :opened_at
  end

  def down
  end
end
