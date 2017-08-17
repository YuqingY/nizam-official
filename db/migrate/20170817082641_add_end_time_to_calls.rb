class AddEndTimeToCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :end_time, :timestamp
  end
end
