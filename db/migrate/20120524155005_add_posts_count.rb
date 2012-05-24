class AddPostsCount < ActiveRecord::Migration
  def up
    add_column :categories, :posts_count, :integer, :default => 0    
    
    Category.reset_column_information
    Category.all.each do |c|
      c.update_attribute :posts_count, c.posts.length
    end        
  end

  def down
    remove_column :categories, :posts_count        
  end
end
