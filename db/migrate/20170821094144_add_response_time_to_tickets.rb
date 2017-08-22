class AddResponseTimeToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :response_time, :bigint
  end
end
