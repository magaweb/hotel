class AddUserIdToGrupos < ActiveRecord::Migration
  def change
    add_column :grupos, :user_id, :integer
  end
end
