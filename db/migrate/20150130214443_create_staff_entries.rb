class CreateStaffEntries < ActiveRecord::Migration
  def change
    create_table :staff_entries do |t|
			t.string "name", :limit => 75
      t.text "summary", :limit => 5000
      t.boolean "is_board_member", :default => false
      t.string "appointed_date", :limit => 175
      t.string "committee1", :limit => 175
      t.string "committee2", :limit => 175
      t.string "committee3", :limit => 175
      t.string "committee4", :limit => 175
      t.string "photo1", :limit => 175
      t.string "photo2", :limit => 175
      t.integer "section"
      t.integer "position"
      t.timestamps null: false
    end
  end
end
