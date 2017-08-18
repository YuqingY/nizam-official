class AddNewCustomerCnicToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :customer_cnic, :string
  end
end
