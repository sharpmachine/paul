class AddPublishedAtToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    remove_column :posts, :published
  end
end
