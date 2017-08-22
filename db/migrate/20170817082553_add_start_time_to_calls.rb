class AddStartTimeToCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :start_time, :timestamp
  end
end
