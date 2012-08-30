class AddSlugToPost < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    
    add_index :posts, :slug, unique: true
    
    add_column :categories, :slug, :string
    
    add_index :categories, :slug, unique: true  

    add_column :products, :slug, :string
    
    add_index :products, :slug, unique: true   
    
    add_column :users, :slug, :string
    
    add_index :users, :slug, unique: true       
  end
end
