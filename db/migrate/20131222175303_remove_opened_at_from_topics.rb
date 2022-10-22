class RemoveOpenedAtFromTopics < ActiveRecord::Migration[7.0]
  def up
  remove_column :topics, :opened_at
  end

  def down
  end
end
