class ChangeDescriptionInFriend < ActiveRecord::Migration
  def up
    change_column :friends, :description, :text
  end

  def down
    change_column :friends, :description, :string    
  end
end
