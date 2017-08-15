class RenameTicketsUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :tickets, :user_id, :author_id
  end
end
