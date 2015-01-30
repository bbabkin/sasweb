class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
			t.string "name", :limit => 175
			t.string "header_content", :limit => 575
      t.timestamps null: false
    end
  end
end
