class RemoveCurrentStateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :current_state
  end
end
