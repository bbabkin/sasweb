class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
			t.string "type", :limit => 175
			t.integer "amount"
			t.string "amount_text"
      t.timestamps null: false
    end
  end
end
