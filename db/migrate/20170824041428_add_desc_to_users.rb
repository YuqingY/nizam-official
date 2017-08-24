class AddDescToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :desc, :string
  end
end
