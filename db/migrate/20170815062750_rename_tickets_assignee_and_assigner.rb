class RenameTicketsAssigneeAndAssigner < ActiveRecord::Migration[5.1]
  def change
    rename_column :tickets, :assignee, :assignee_id
    rename_column :tickets, :assigner, :assigner_id
  end
end
