class Admin::SharesController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @headers = Header.all
    @shares = Share.all
  end

  def new
    @shares = Share.all
    @share = Share.new()
  end

  def create
    @share = Share.new(share_params)
      if @share.save
      flash[:notice] = "Share text created successfully."
      redirect_to(:action => 'index')
    else
      @share_count = Share.count + 1
      render('new')
    end
  end

  def edit
    @share = Share.find(params[:id])
    @share_count = Share.count
    @header = Header.find(3)
    @header_count = Header.count
  end

  def update
    @share = Share.find(params[:id])
    if @share.update_attributes(share_params)
      flash[:notice] = "Share text updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @share_count = Share.count
      render('edit')
    end

    @header = Header.find(params[:id])
    if @header.update_attributes(header_params)
      flash[:notice] = "Header text updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @header_count = Header.count
      render('edit')
    end
  end

  def delete
    @share = Share.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldn't be here
    @share = Share.find(params[:id]).destroy
    flash[:notice] = "Share text removed successfully."
    redirect_to(:action => 'index')
  end


  private

    def share_params
      params.require(:share).permit(:type, :amount, :amount_text)
    end

    def header_params
      params.require(:header).permit(:name, :content)
    end


end