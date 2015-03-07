Rails.application.routes.draw do
  
  root "public#index"
  #match ':controller(/:action(/:id))', :via => [:get, :post]
  get "public/news" 
  get "public/careers"
  get "public/disclamer"

  #==CORPORATE=========
  get "public/corporate" 
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
  get "public/adv_projects"
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
  get "public/services"
  get "public/links"
  get "public/sas_tv"

  #====CONTACT=======
  get "public/contact_info"
  get "public/request_info"
  get "public/send_message"
  get "public/feedback"


  
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
  end
end