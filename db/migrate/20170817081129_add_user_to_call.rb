class AddUserToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :user_id, :reference, null:false
  end
end
