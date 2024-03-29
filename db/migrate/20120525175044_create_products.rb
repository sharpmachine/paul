class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end