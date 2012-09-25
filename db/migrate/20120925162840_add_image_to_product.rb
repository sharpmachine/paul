class AddImageToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image, :string
    remove_column :products, :image_file_name   
    remove_column :products, :image_content_type
    remove_column :products, :image_file_size   
    remove_column :products, :image_updated_at  
  end
end
