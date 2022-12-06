class AddSlugNameToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :slug_name, :string
  end
end
