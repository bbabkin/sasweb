class Admin::IcontentsController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @icontents = Icontent.all

  end

  def new
    @icontent = Icontent.new()

    @icontent_count = Icontent.count + 1
  end

  def create
    @icontent = Icontent.new(icontent_params)
      if @icontent.save
      flash[:notice] = "Content image created successfully."
      redirect_to(:action => 'index')
    else
      @icontent_count = Icontent.count + 1
      render('new')
    end
  end

  def edit
    @icontent = Icontent.find(params[:id])
    @icontent_count = Icontent.count
  end

  def update
    @icontent = Icontent.find(params[:id])
    if @icontent.update_attributes(icontent_params)
      flash[:notice] = "Content image updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @icontent_count = Icontent.count
      render('edit')
    end
  end

  def delete
    @icontent = Icontent.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldn't be here
    @icontent = Icontent.find(params[:id]).destroy
    flash[:notice] = "Content image removed successfully."
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

    def icontent_params
      params.require(:icontent).permit(:iid, :image, :description)
    end


end