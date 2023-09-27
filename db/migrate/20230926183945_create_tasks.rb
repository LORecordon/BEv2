class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: true
      t.integer :style
      t.text :topic
      t.integer :difficulty
      t.integer :quests, array: true, default: []
      t.integer :double_attempts
      t.integer :score
      t.timestamps
    end
  end
end
