class AddFriendimageToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :friendimage, :string
  end
end
