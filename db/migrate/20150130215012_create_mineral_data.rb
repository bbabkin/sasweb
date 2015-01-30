class CreateMineralData < ActiveRecord::Migration
  def change
    create_table :mineral_data do |t|
			t.string "mine_name", :limit => 175
			t.string"mine_data", array: true, default: '{}'
      t.integer "data_type"
      t.timestamps null: false
    end
  end
end
