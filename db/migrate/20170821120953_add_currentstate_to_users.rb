class AddCurrentstateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_state, :string, null: false, default: 'off-duty'
  end
end
