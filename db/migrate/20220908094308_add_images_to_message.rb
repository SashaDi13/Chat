class AddImagesToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :images, :string, array: true, default: []
  end
end
