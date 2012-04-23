class RemoveTitleFromPicture < ActiveRecord::Migration
  def up  
    remove_column :pictures, :title
  end

  def down
    add_column :pictures, :title, :string   
  end
end
