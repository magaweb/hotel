class AddImageToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :image_id, :string
  end
end
