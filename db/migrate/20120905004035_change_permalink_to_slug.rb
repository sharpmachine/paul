class ChangePermalinkToSlug < ActiveRecord::Migration
  def up
    rename_column :pages, :permalink, :slug
  end

  def down
    rename_column :pages, :slug, :permalink
  end
end
