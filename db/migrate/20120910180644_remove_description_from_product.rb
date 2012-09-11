class RemoveDescriptionFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :description
  end

  def down
    add_column :products, :description, :string
  end
end
