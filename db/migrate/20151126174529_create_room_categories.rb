class CreateRoomCategories < ActiveRecord::Migration
  def change
    create_table :room_categories do |t|
      t.string :name
      t.references :hotel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
