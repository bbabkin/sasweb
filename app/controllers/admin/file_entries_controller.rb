class Admin::ProductsController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @fileentrys = FileEntry.sorted

  end

  def show
    @fileentry = FileEntry.find(params[:id])
  end

  def new
    @fileentry = FileEntry.new()

    @fileentry_count = FileEntry.count + 1
  end

  def create
    @fileentry = FileEntry.new(fileentry_params)
      if @fileentry.save
      flash[:notice] = "File created successfully."
      redirect_to(:action => 'index')
    else
      @fileentry_count = FileEntry.count + 1
      render('new')
    end
  end

  def edit
    @fileentry = FileEntry.find(params[:id])
    @fileentry_count = FileEntry.count
  end

  def update
    @fileentry = FileEntry.find(params[:id])
    if @fileentry.update_attributes(fileentry_params)
      flash[:notice] = "File updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @fileentry_count = FileEntry.count
      render('edit')
    end
  end

  def delete
    @fileentry = FileEntry.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldnt be here
    @fileentry = FileEntry.find(params[:id]).destroy
    flash[:notice] = "File removed successfully."
    redirect_to(:action => 'index')
  end


  private

    def product_params
      params.require(:file_entry).permit(
        :name, :description, :type, :link
        )
    end


end