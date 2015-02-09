class AddTitleToStaffEntries < ActiveRecord::Migration
  def change
  	add_column :staff_entries, :title, :string
  end
end
