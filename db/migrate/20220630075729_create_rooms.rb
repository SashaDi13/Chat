class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :user
      t.boolean :private, default: false
      t.string :avatar
      t.string :status

      t.timestamps
    end
  end
end
