class HeadersController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @headers = Header.all
  end

  def show
    @header = Header.find(params[:id])
    @headers = Header.all
  end

end