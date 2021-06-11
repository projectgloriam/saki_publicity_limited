class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.date :event_date_start
      t.date :event_date_end
      t.time :event_time_start
      t.time :event_time_end
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
