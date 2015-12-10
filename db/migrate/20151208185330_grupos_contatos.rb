class GruposContatos < ActiveRecord::Migration
  def change
    create_table :grupos_contatos, :id => false do |t|
      t.integer :grupo_id
      t.integer :contato_id
    end
  end
end
