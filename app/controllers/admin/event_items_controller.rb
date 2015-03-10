class Admin::EventItemsController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @eventitems = EventItem.sorted

  end

  def show
    @eventitem = EventItem.find(params[:id])
  end

  def new
    @eventitem = EventItem.new()

    @eventitem_count = EventItem.count + 1
  end

  def create
    @eventitem = EventItem.new(event_item_params)
      if @eventitem.save
      flash[:notice] = "Event entry created successfully."
      redirect_to(:action => 'index')
    else
      @eventitem_count = EventItem.count + 1
      render('new')
    end
  end

  def edit
    @eventitem = EventItem.find(params[:id])
    @eventitem_count = EventItem.count
  end

  def update
    @eventitem = EventItem.find(params[:id])
    if @eventitem.update_attributes(event_item_params)
      flash[:notice] = "Event entry updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @eventitem_count = EventItem.count
      render('edit')
    end
  end

  def delete
    @eventitem = EventItem.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldnt be here
    @eventitem = EventItem.find(params[:id]).destroy
    flash[:notice] = "Event entry removed successfully."
    redirect_to(:action => 'index')
  end
  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  private

    def event_item_params
      params.require(:event_item).permit(:short_entry, :long_entry, :event_date, :position, :permalink)
    end


end