class CreateJoinTableHotelGrupo < ActiveRecord::Migration
  def change
    create_join_table :Hotels, :Grupos do |t|
      # t.index [:hotel_id, :grupo_id]
      # t.index [:grupo_id, :hotel_id]
    end
  end
end
