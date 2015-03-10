class CreateIcontents < ActiveRecord::Migration
  def change
    create_table :icontents do |t|
    	t.integer "iid"
    	t.string "image"
    	t.string "description"
    end
    add_index("icontents","iid")
  end
end
