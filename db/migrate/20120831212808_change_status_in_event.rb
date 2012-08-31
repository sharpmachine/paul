class ChangeStatusInEvent < ActiveRecord::Migration
  def up
    change_column :events, :status, :string, :default => "new"
  end

  def down
  end
end
