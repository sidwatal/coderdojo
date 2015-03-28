class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_title
      t.string :event_place
      t.text :event_description
      t.datetime :event_date
      t.integer :event_number_tickets

      t.timestamps null: false
    end
  end
end
