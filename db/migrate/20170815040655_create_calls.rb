class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.references :ticket, foreign_key: true
      t.timestamp :duration

      t.timestamps
    end
  end
end
