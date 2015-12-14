class AddTipoToGruposHotels < ActiveRecord::Migration
  def change
    add_column :grupos_hotels, :tipo, :integer
  end
end
