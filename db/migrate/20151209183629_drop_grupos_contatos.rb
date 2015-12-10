class DropGruposContatos < ActiveRecord::Migration
  def up
    drop_table :grupos_contatos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
