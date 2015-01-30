class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|

      t.timestamps null: false
    end
  end
end
