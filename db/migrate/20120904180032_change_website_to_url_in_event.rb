class ChangeWebsiteToUrlInEvent < ActiveRecord::Migration
  def up
    rename_column :events, :website, :url
  end

  def down
    rename_column :events, :url, :website
  end
end
