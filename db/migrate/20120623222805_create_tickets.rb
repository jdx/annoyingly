class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :from
      t.string :subject
      t.text :plain
      t.text :html

      t.timestamps
    end
  end
end
