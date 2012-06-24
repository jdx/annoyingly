class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from
      t.string :subject
      t.text :plain
      t.text :html
      t.references :tickets

      t.timestamps
    end
  end
end
