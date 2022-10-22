class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics, :id => false do |t|
      t.integer :id
      t.text :title
      t.string :opened_by
      t.datetime :opened_at
      t.boolean :active

      t.timestamps
    end
  end
end
