Rails.application.routes.draw do
  
  resources :tags, :only => [:show]
  
end
