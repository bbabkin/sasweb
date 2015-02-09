class ChangeDefaultArrayInMineData < ActiveRecord::Migration
  def up
  	remove_column :mineral_data, :mine_data
  	add_column :mineral_data, :mine_data, :string, array: true, default: []
  end
  def down
		remove_column :mineral_data, :mine_data
		add_column :mineral_data, :mine_data, :string, array: true, default: '{}'
  end
end
