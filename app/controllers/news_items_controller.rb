class ProductsController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @newsitems = NewsItem.sorted
  end

  def show
    @newsitem = NewsItem.find(params[:id])
    @newsitems = NewsItem.sorted
  end

end