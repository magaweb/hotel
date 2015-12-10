class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :email
      t.string :tel
      t.string :endereco
      t.string :obs

      t.timestamps null: false
    end
  end
end
