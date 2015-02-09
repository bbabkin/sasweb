class EventItemsController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @eventitems = EventItem.sorted
  end

  def show
    @eventitem = EventItem.find(params[:id])
    @eventitems = EventItem.sorted
  end

end