class AddIndexToProduct < ActiveRecord::Migration
  def change
    execute "create index products_search on products using gin((to_tsvector('english', coalesce(\"products\".\"title\"::text, '')) || to_tsvector('english', coalesce(\"products\".\"author\"::text, '')) || to_tsvector('english', coalesce(\"products\".\"short_description\"::text, '')) || to_tsvector('english', coalesce(\"products\".\"product_type\"::text, ''))))"         
  end
end
