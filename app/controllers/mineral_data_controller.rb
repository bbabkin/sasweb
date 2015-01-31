class ProductsController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @mineraldata = MineralDatum.sorted
  end

  def show
    @mineraldatum = MineralDatum.find(params[:id])
    @mineraldata = MineralDatum.sorted
  end

end