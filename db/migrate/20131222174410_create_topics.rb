class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :id
      t.text :title
      t.string :opened_by
      t.datetime :opened_at
      t.boolean :active

      t.timestamps
    end
  end
end
