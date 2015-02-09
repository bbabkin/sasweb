class RenameHeaderToContentInHeader < ActiveRecord::Migration
  def change
  	rename_column :headers, :header, :content
  end
end
