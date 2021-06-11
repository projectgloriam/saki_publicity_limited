class ChangeLocationColumnToEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :location
  	add_reference :events, :location, index: true
  end
end
