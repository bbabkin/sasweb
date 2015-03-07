class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
			t.string "short_entry", :limit => 375
			t.string "permalink", :limit => 175
			t.text "long_entry", :limit => 10000
			t.string "news_date", :limit => 150
      t.timestamps null: false
    end
  end
end
