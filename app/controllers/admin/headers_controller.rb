class Admin::HeadersController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @headers = Header.sorted

  end

  def new
    @header = Header.new()

    @header_count = Header.count + 1
  end

  def create
    @header = Header.new(header_params)
      if @header.save
      flash[:notice] = "Header text created successfully."
      redirect_to(:action => 'index')
    else
      @header_count = Header.count + 1
      render('new')
    end
  end

  def edit
    @header = Header.find(params[:id])
    @header_count = Header.count
  end

  def update
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
    @header = Header.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldn't be here
    @header = Header.find(params[:id]).destroy
    flash[:notice] = "Header text removed successfully."
    redirect_to(:action => 'index')
  end


  private

    def header_params
      params.require(:header).permit(:name, :content)
    end


end