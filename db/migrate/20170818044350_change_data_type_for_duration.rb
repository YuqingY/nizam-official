class ChangeDataTypeForDuration < ActiveRecord::Migration[5.1]
  def change
  def self.up
    change_table :tablename do |t|
      t.change :fieldname, :number
    end
  end
  def self.down
    change_table :tablename do |t|
      t.change :fieldname, :datetime
    end
  end
  end
end

