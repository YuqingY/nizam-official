class RemoveCustomerFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :customer_id
  end
end
