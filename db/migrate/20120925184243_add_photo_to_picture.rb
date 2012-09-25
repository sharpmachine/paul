class AddPhotoToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :photo, :string
    remove_column :pictures, :image_file_name   
    remove_column :pictures, :image_content_type
    remove_column :pictures, :image_file_size       
    remove_column :pictures, :image_updated_at      
  end
end
