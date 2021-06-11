class AddCheckedInToEventsStaffs < ActiveRecord::Migration
  def up
  	add_column :events_staffs, :checkedin, :boolean, :default => false
  end

  def down
  	remove_column :events_staffs, :checkedin
  end
end
