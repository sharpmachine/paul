class AddFeaturedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :featured, :boolean, :default => false, :null => false
  end
end
