class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.text :description
      t.datetime :event_date
      t.integer :number_of_tickets

      t.timestamps null: false
    end
  end
end
