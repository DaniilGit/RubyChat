class CreateRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_users do |t|
      t.references :room
      t.references :user
    end
  end
end
