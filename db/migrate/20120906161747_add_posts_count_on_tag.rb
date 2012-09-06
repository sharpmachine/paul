class AddPostsCountOnTag < ActiveRecord::Migration
  def up
    add_column :tags, :posts_count, :integer, :default => 0
  end

  def down
    remove_column :tags, :posts_count
  end
end
