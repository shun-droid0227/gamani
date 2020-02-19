class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :chat_thread_id
      t.string :imege_id
      t.text :sentence

      t.timestamps
    end
  end
end
