class AddFeaturedToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :featured, :boolean
  end
end
