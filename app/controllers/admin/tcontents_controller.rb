class Admin::TcontentsController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @tcontents = Tcontent.all

  end

  def new
    @tcontent = Tcontent.new()

    @tcontent_count = Tcontent.count + 1
  end

  def create
    @tcontent = Tcontent.new(tcontent_params)
      if @tcontent.save
      flash[:notice] = "Content text created successfully."
      redirect_to(:action => 'index')
    else
      @tcontent_count = Tcontent.count + 1
      render('new')
    end
  end

  def edit
    @tcontent = Tcontent.find(params[:id])
    @tcontent_count = Tcontent.count
  end

  def update
    @tcontent = Tcontent.find(params[:id])
    if @tcontent.update_attributes(tcontent_params)
      flash[:notice] = "Content text updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @tcontent_count = Tcontent.count
      render('edit')
    end
  end

  def delete
    @tcontent = Tcontent.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldn't be here
    @tcontent = Tcontent.find(params[:id]).destroy
    flash[:notice] = "Content text removed successfully."
    redirect_to(:action => 'index')
  end


  private

    def tcontent_params
      params.require(:tcontent).permit(:stringid, :data)
    end


end