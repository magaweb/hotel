class CreateJoinTableGrupoContato < ActiveRecord::Migration
  def change
    create_join_table :grupos, :contatos do |t|
      # t.index [:grupo_id, :contato_id]
      # t.index [:contato_id, :grupo_id]
    end
  end
end
