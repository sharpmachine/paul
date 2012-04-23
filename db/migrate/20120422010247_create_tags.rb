class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tagstring

      t.timestamps
    end
  end
end
