class AddStartAndEndTimeToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :start_time, :time
    add_column :tickets, :end_time, :time
  end
end
