class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
			t.string "short_entry", :limit => 375
			t.text "long_entry", :limit => 10000
			t.datetime "created_at"
      t.timestamps null: false
    end
    add_index("news_items", "created_at")
  end
end
