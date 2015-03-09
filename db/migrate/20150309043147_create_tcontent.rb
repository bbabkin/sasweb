class CreateTcontent < ActiveRecord::Migration
  def change
    create_table :tcontents do |t|
    	t.integer "stringid"
    	t.text "data"
    end
    add_index("tcontents","stringid")
  end
end
