class CreateFileEntries < ActiveRecord::Migration
  def change
    create_table :file_entries do |t|
		t.string "name", :limit => 275
		t.text "description" :limit => 5000
		t.integer "type"
		t.string "link"
      t.timestamps null: false
    end
  end
end
