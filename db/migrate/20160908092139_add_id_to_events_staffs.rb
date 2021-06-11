class AddIdToEventsStaffs < ActiveRecord::Migration
  def up
  	add_column :events_staffs, :id, :primary_key
  end
  def down
  	remove_column :events_staffs, :id
  end
end