Rails.application.routes.draw do
  
  root "public#index"
  #match ':controller(/:action(/:id))', :via => [:get, :post]
  get "public/news" 
  get "public/careers"
  get "public/disclamer"

  #==CORPORATE=========
  get "public/profile"
  get "public/directors" 
  get "public/management" 
  get "public/corp_responsibility"
  get "public/governance" 
  get "public/whistleblower"
  get "public/information" 
 
  #==OPERATIONS=========
  get "public/operations" 
  get "public/timmins"
  get "public/history"
  get "public/regional_geo" 
  get "public/holt_mine" 
  get "public/holloway_mine"
  get "public/hislop_mine" 
  get "public/holt_mill" 
  get "public/exploration" 
  get "public/taylor_project"
  get "public/regional_exp" 
  get "public/reserves_resources"
  get "public/tech_reports"
  get "public/gallery"

  #====INVESTORS=======
  get "public/invest_snapshot"
  get "public/financial_database"
  get "public/events"
  get "public/presentations"
  get "public/annual_reports"
  get "public/share_services"
  get "public/reg_filings"
  get "public/analyst_coverage"
  get "public/links"

  #====CONTACT=======
  get "public/contact"



  
  resources :news_items do
  end
  resources :event_items do
  end
  resources :file_entries do
  end
  resources :staff_entries do
  end
  resources :mineral_data do
  end
  resources :headers do
  end
  resources :tcontents do
  end
  resources :icontents do
  end
  resources :carousel_images do
  end

  
  get 'admin', :to => "admin/access#index"
  namespace :admin do
    resources :admin_users do
    end
    get 'logout', :to => "access#logout"
    get 'login', :to => "access#login"
    get 'attempt_login', :to => "access#attempt_login"
    post 'attempt_login', :to => "access#attempt_login"
    
    resources :news_items do
      member do
        get :delete
      end
    end
    resources :event_items do
      member do
        get :delete
      end
    end    
    resources :file_entries do
      member do
        get :delete
      end
    end   
    resources :mineral_data do
      member do
        get :delete
      end
    end   
    resources :staff_entries do
      member do
        get :delete
      end
    end
    resources :headers do
      member do
        get :delete
      end
    end  
    resources :tcontents do
      member do
        get :delete
      end
    end 
    resources :icontents do
      member do
        get :delete
      end
    end 
    resources :carousel_images do
      member do
        get :delete
      end
    end   
  end
end