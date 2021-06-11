class CreateEventsStaffs < ActiveRecord::Migration
  def up
    create_table :events_staffs, :id => false do |t|
      t.references :event, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.string :staff_qr_code

      t.timestamps null: false
    end
    add_index :events_staffs, ["event_id", "staff_id"]
  end

  def down
  	drop_table :events_staffs
  end
end
