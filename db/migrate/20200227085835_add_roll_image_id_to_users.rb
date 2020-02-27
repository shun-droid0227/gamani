class AddRollImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :roll_image_id, :string
  end
end
