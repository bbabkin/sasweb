class ProductsController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @fileentries = FileEntry.sorted
  end

  def show
    @fileentry = FileEntry.find(params[:id])
    @fileentries = FileEntry.sorted
  end

end