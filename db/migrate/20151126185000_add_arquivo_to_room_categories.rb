class AddArquivoToRoomCategories < ActiveRecord::Migration
  def change
    add_column :room_categories, :arquivo_id, :string
  end
end
