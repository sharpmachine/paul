class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :title
      t.string :name
      t.string :description
      t.string :url
      t.integer :picture_id
      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end