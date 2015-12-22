class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.integer :user_id
      t.string :nome
      t.string :email
      t.string :tel
      t.string :endereco
      t.text :obs

      t.timestamps null: false
    end
  end
end
