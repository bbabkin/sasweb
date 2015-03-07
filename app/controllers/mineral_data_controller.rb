class MineralDataController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @mineraldata = MineralDatum.all
  end

  def show
    @mineraldatum = MineralDatum.find(params[:id])
    @mineraldata = MineralDatum.all
  end

end