class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|
			t.text "short_entry", :limit => 5000
			t.text "long_entry", :limit => 10000
			t.string "event_date", :limit => 150
			t.datetime "event_datetime"
			t.datetime "created_at"
			t.integer "position"
      t.timestamps null: false
    end
  end
end
