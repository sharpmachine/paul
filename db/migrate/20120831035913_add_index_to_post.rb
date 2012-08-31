class AddIndexToPost < ActiveRecord::Migration
  def change
    execute "create index posts_search on posts using gin((to_tsvector('english', coalesce(\"posts\".\"title\"::text, '')) || to_tsvector('english', coalesce(\"posts\".\"content\"::text, ''))))"     
  end
end
