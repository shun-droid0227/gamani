class CreateChatThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_threads do |t|
      t.string :name
      t.integer :game_tittle_id

      t.timestamps
    end
  end
end
