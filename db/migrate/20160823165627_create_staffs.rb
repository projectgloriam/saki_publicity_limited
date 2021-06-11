class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :staff_first_name
      t.string :staff_last_name
      t.string :staff_email
      t.string :staff_telephone
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
