class AddShortDescriptionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :short_description, :text
  end
end
