class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_keys: true
      t.references :follow, foreign_keys: {to_table: :users}

      t.timestamps

      t.index [:user_id, :follow_id],unique: true
    end
  end
end
