class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
			t.string "short_entry", :limit => 375
			t.text "long_entry", :limit => 10000
      t.timestamps null: false
    end
  end
end
