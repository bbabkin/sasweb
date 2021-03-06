class Admin::SubscribersController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @subscribers = Subscriber.all
    respond_to do |format|
      format.html
      format.csv { render text: @subscribers.to_csv }
  end
end

  def new
    @subscriber = Subscriber.new()

    @subscriber_count = Subscriber.count + 1
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save
      flash[:notice] = "Subscriber created successfully."
      redirect_to(:action => 'index')
    else
      @subscriber_count = Subscriber.count + 1
      render('new')
    end
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
    @subscriber_count = Subscriber.count
  end

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update_attributes(subscribers_params)
      flash[:notice] = "Subscriber updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @subscriber_count = Subscriber.count
      render('edit')
    end
  end

  def delete
    @subscriber = Subscriber.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldn't be here
    @subscriber = Subscriber.find(params[:id]).destroy
    flash[:notice] = "Subscriber removed successfully."
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

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end


end