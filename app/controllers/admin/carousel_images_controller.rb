class Admin::CarouselImagesController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @carouselimages = CarouselImage.sorted

  end

  def new
    @carouselimage = CarouselImage.new()

    @carouselimage_count = CarouselImage.count + 1
  end

  def create
    @carouselimage = CarouselImage.new(carousel_image_params)
      if @carouselimage.save
      flash[:notice] = "Carousel Image created successfully."
      redirect_to(:action => 'index')
    else
      @carouselimage_count = CarouselImage.count + 1
      render('new')
    end
  end

  def edit
    @carouselimage = CarouselImage.find(params[:id])
    @carouselimage_count = CarouselImage.count
  end

  def update
    @carouselimage = CarouselImage.find(params[:id])
    if @carouselimage.update_attributes(carouselimage_params)
      flash[:notice] = "Carousel Image updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @carouselimage_count = CarouselImage.count
      render('edit')
    end
  end

  def delete
    @carouselimage = CarouselImage.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldn't be here
    @carouselimage = CarouselImage.find(params[:id]).destroy
    flash[:notice] = "Carousel Image removed successfully."
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

    def carousel_image_params
      params.require(:carousel_image).permit(:image, :title, :description)
    end


end