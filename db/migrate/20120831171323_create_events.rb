class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :organization
      t.string :name
      t.string :phone
      t.string :email
      t.string :organization_address
      t.string :organization_address2
      t.string :organization_city
      t.string :organization_state
      t.string :organization_zip
      t.string :organization_country
      t.string :website
      t.string :event_type
      t.text :theme
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :estimated_attendance
      t.string :other_speakers
      t.boolean :budget_for_additional_traveller
      t.string :housing
      t.boolean :bethel_students
      t.integer :bethel_students_total
      t.boolean :bethel_student_housing
      t.string :location_name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.text :information
      t.string :airport
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end