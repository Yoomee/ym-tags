Rails.application.routes.draw do
  
  resources :tags, :only => [:show] do 
    get :autocomplete_tag_name, :on => :collection
  end
  
end
