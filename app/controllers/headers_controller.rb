class HeadersController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @headers = Header.sorted
  end

  def show
    @header = Header.find(params[:id])
    @headers = Header.sorted
  end

end