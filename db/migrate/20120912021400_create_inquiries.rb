class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :inquiries do |t|
      t.string :email
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :inquiries
  end
end