class RemoveCustomerCnicFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :customer_cnic
  end
end
