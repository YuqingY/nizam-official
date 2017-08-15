class AddCustomerIdToTickets < ActiveRecord::Migration[5.1]
  def change
     add_column :tickets, :customer_id, :string
  end
end
