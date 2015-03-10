class PublicController < ApplicationController
layout 'public'
 #===Common Models========


 #==GENERAL=========
  def index
    @tcontent = Tcontent.find_by stringid: 1
    @carouselimages = CarouselImage.sorted
  end
  def disclamer
  end
  def news
    @newsitems = NewsItems.all
  end
  def careers
  end
  def contact_info
  end
  def profile 
  end
  def directors 
  end
  def management 
  end
  #==CORPORATE=========
  def corp_responsibility
  end
  def governance 
  end
  def whistleblower 
  end
  def information 
  end
  #==Mines and Projects=========
  def mines 
  end
  def timmins
  end
  def history 
  end
  def regional_geo 
  end
  def holt_mine 
  end
  def holloway_mine
  end
  def hislop_mine 
  end
  def holt_mill 
  end
  def exploration 
  end
  def taylor_project 
  end
  def regional_exp 
  end
  def reserves_resources
  end
  def tech_reports
  end
  def gallery
  end
  #====INVESTORS=======
  def invest_snapshot
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
  def share_services
  end
  def reg_filings
  end
  def links
  end



end
