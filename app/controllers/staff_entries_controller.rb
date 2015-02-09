class StaffEntriesController < ApplicationController

layout 'public'


  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @staffentries = StaffEntry.sorted
  end

  def show
    @staffentry = StaffEntry.find(params[:id])
    @staffentries = StaffEntry.sorted
  end

end