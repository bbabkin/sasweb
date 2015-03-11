class PublicController < ApplicationController
layout 'public'
before_action :emailcount
 #==GENERAL=========
  def index
    @tcontent = Tcontent.find_by stringid: 1
    @carouselimages = CarouselImage.sorted


  end
  def create
    @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save
      flash[:notice] = "Subscriber created successfully."
      redirect_to(:action => 'index')
    end
  end
  def news
    @newsitems = NewsItems.all
  end
  def profile 
    @tcontent = Tcontent.find_by stringid: 2
  end
  def directors 
  end
  def management 
  end
  #==CORPORATE=========
  def corp_responsibility
    @tcontent = Tcontent.find_by stringid: 3
  end
  def governance
    @tcontent = Tcontent.find_by stringid: 4 
  end
  def whistleblower 
    @tcontent = Tcontent.find_by stringid: 5
  end
  def information 
    @tcontent = Tcontent.find_by stringid: 6
  end
  #==Mines and Projects=========
  def mines 
  end
  def timmins
  end
  def history
    @tcontent = Tcontent.find_by stringid: 7
  end
  def regional_geo 
    @tcontent = Tcontent.find_by stringid: 8
  end
  def holt_mine 
    @tcontent = Tcontent.find_by stringid: 9
  end
  def holloway_mine
    @tcontent = Tcontent.find_by stringid: 10
  end
  def hislop_mine 
    @tcontent = Tcontent.find_by stringid: 11
  end
  def holt_mill 
    @tcontent = Tcontent.find_by stringid: 12
  end
  def exploration 
  end
  def taylor_project 
    @tcontent = Tcontent.find_by stringid: 13
  end
  def regional_exp 
    @tcontent = Tcontent.find_by stringid: 14
  end
  def reserves_resources
    @tcontent = Tcontent.find_by stringid: 15
  end
  def tech_reports
    @tcontent = Tcontent.find_by stringid: 16
  end
  def gallery
  end
  #====INVESTORS=======
  def invest_snapshot
    @tcontent = Tcontent.find_by stringid: 17
  end
  def financial_database
  end
  def events
  end
  def presentations
  end
  def analyst_coverage
  end
  def annual_reports
  end  
  def reg_filings
    @tcontent = Tcontent.find_by stringid: 18
  end
  def share_services
    @tcontent = Tcontent.find_by stringid: 19
  end
  def links
    @tcontent = Tcontent.find_by stringid: 20
  end
  def contact
    @tcontent = Tcontent.find_by stringid: 21  
  end
  def careers
    @tcontent = Tcontent.find_by stringid: 22
  end
  def disclaimer
    @tcontent = Tcontent.find_by stringid: 23
  end
  def privacy_policy
    @tcontent = Tcontent.find_by stringid: 24
  end
  #-----==========GLOBAL VARS==========--------#
  
  @subscriber = Subscriber.new()
  def create 
  @subscriber = Subscriber.new(subscriber_params)  
  if @subscriber.save
    flash[:notice] = "E-mail added successfully."
    redirect_to :action => :index
  end
end

  #8==>--- PRIVATES

private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

  def emailcount
    @emailcount = Subscriber.count + 1
  end

end
