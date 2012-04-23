class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    add_index :categories, :id, :unique => true
    add_index :posts, :id, :unique => true
    add_index :tags, :id, :unique => true
    add_index :tagships, :tag_id
    add_index :tagships, :post_id    
  end
end
