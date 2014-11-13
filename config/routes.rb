Rails.application.routes.draw do

  resources :articles do  #Created a new resource
    resources :comments   #This creates comments as a nested resource within articles
  end
  root 'welcome#index'  #set the home page to welcome/index

  
end
