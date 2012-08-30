class ChangeDescriptionTypeInPicture < ActiveRecord::Migration
  def up
    change_column :pictures, :description, :text
  end

  def down
    change_column :pictures, :description, :string    
  end
end
