class CreateGameTittles < ActiveRecord::Migration[5.2]
  def change
    create_table :game_tittles do |t|
      t.string :name
      t.integer :game_genle_id

      t.timestamps
    end
  end
end
