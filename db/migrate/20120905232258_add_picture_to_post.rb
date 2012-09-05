class AddPictureToPost < ActiveRecord::Migration
  def change
    add_column :posts, :picture_id, :integer
  end
end
