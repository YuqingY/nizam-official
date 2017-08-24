class AddResolveTimeToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :resolve_time, :bigint
  end
end
