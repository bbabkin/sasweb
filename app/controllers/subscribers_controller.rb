class SubscribersController < ApplicationController

layout 'public'
  
  def create
    @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save
      flash[:notice] = "Content text created successfully."
      redirect_to controller: "public", action: "index"
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end

end