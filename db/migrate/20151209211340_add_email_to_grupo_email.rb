class AddEmailToGrupoEmail < ActiveRecord::Migration
  def change
    add_column :grupo_emails, :email, :string
  end
end
