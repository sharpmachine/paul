class CreateInstacaches < ActiveRecord::Migration
  def change
    create_table :instacaches do |t|
      t.string :thumbnail_url
      t.string :low_resolution_url
      t.string :link_url

      t.timestamps
    end
  end
end
