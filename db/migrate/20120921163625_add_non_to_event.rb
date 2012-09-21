class AddNonToEvent < ActiveRecord::Migration
  def change
    add_column :events, :non_specific_date_info, :string
  end
end
