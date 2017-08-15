class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :imei
      t.references :user, foreign_key: true
      t.string :category
      t.string :department
      t.bigint :assigner
      t.bigint :assignee
      t.string :status
      t.string :next_step
      t.string :description

      t.timestamps
    end
  end
end
