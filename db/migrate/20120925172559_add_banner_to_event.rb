class AddBannerToEvent < ActiveRecord::Migration
  def change
    add_column :events, :banner, :string    
    remove_column :events, :banner_file_name        
    remove_column :events, :banner_content_type     
    remove_column :events, :banner_file_size        
    remove_column :events, :banner_updated_at       
  end
end
