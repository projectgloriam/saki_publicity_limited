class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :organization_name
      t.string :organization_address
      t.string :organization_telephone
      t.string :organization_email

      t.timestamps null: false
    end
  end
end
