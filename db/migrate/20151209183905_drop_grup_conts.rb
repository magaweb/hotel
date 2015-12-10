class DropGrupConts < ActiveRecord::Migration
  def up
    drop_table :grup_conts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
