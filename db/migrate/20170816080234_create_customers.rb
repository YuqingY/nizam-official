class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.numeric :cnic
      t.numeric :imei
      t.timestamps
    end
  end
end
