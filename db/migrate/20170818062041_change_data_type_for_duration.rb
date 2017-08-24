class ChangeDataTypeForDuration < ActiveRecord::Migration[5.1]
  def change
    remove_column :calls, :duration
    add_column :calls, :duration, :bigint
  end
end
