class RenameTypeToFileType < ActiveRecord::Migration
  def change
  	rename_column :file_entries, :type, :file_type
  end
end
