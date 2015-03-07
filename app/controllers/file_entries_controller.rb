class FileEntriesController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @fileentries = FileEntry.newest_first
  end

  def show
    @fileentry = FileEntry.find(params[:id])
    @fileentries = FileEntry.newest_first
  end

end