class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
			t.string "username", :limit => 50
			t.string "password_digest"
			t.timestamps
    end
    add_index("admin_users", "username")
  end
end
