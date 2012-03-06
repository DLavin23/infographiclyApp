InfographiclyApp::Application.routes.draw do
 
  get "articles/index", :as => :articles
  get "articles/show", :as => :article
  
  get "update" => "articles#update"

  root :to => "pages#home"
 
  get 'home' => "pages#home"
  get 'about' => "pages#about"
  get 'contact' => "pages#contact"

  
  get "login" => "sessions#new"
  get "logout" => "sessions#logout"
  post "/sessions" => "sessions#create"

  resources :users
  
end

