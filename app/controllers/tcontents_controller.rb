class TcontentsController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @tcontents = Tcontent.all
  end

  def show
    @tcontent = Tcontent.find(params[:id])
    @tcontents = Tcontent.all
  end

end