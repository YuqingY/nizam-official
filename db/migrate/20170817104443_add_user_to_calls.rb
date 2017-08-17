class AddUserToCalls < ActiveRecord::Migration[5.1]
  def change
    add_reference :calls, :user, foreign_key: true, null: false
  end
end
