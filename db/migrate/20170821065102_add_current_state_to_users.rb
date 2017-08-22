class AddCurrentStateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_state, :string
  end
end
