class AddFileToFileEntries < ActiveRecord::Migration
  def change
  	add_column :file_entries, :file, :string
  end
end
