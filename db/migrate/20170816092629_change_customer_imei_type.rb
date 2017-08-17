class ChangeCustomerImeiType < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :imei, :string
    change_column :customers, :cnic, :string
  end
end
