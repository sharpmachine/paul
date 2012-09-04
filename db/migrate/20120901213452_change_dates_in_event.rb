class ChangeDatesInEvent < ActiveRecord::Migration
  def up
    change_column :events, :starts_at, :date
    change_column :events, :ends_at, :date    
  end

  def down
    change_column :events, :starts_at, :datetime
    change_column :events, :ends_at, :datetime
  end
end
