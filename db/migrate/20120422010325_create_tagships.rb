class CreateTagships < ActiveRecord::Migration
  def change
    create_table :tagships do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
