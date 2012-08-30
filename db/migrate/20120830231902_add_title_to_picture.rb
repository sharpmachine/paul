class AddTitleToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :title, :string
    add_column :pictures, :description, :string
    add_column :pictures, :published, :boolean, :default => false
    add_column :pictures, :slug, :string
    add_index :pictures, :slug, unique: true    
  end
end
