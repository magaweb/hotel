class AddEnableToShares < ActiveRecord::Migration
  def change
    add_column :shares, :enable, :integer
  end
end
