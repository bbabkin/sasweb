class Admin::ProductsController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in


  def index
    @newsitems = NewsItem.sorted

  end

  def show
    @newsitem = NewsItem.find(params[:id])
  end

  def new
    @newsitem = NewsItem.new()

    @newsitem_count = NewsItem.count + 1
  end

  def create
    @newsitem = NewsItem.new(newsitem_params)
      if @newsitem.save
      flash[:notice] = "News article created successfully."
      redirect_to(:action => 'index')
    else
      @newsitem_count = NewsItem.count + 1
      render('new')
    end
  end

  def edit
    @newsitem = NewsItem.find(params[:id])
    @newsitem_count = NewsItem.count
  end

  def update
    @newsitem = NewsItem.find(params[:id])
    if @newsitem.update_attributes(newsitem_params)
      flash[:notice] = "News article updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @newsitem_count = NewsItem.count
      render('edit')
    end
  end

  def delete
    @newsitem = NewsItem.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldnt be here
    @newsitem = NewsItem.find(params[:id]).destroy
    flash[:notice] = "News article removed successfully."
    redirect_to(:action => 'index')
  end


  private

    def product_params
      params.require(:news_item).permit(:short_entry, :long_entry)
    end


end