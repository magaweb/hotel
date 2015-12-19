class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :hotel_id
      t.integer :grupo_id
      t.integer :tipo

      t.timestamps null: false
    end
  end
end
