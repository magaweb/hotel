class AddPublicShareToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :public_share, :integer
  end
end
