class AddActivityToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :activity, :string
  end
end
