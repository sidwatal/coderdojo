class AddActivitiesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :activities, :string
  end
end
