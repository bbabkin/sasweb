class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
    	t.string "email", :limit => 50
    end
  end
end
