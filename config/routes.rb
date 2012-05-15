InfographiclyApp::Application.routes.draw do
 
  root :to => "pages#home"
  get "articles/index", :as => :articles
  get "articles/:id" => 'articles#show', :as => :article
  post "articles/:id/tags" => 'articles#tag'
  
  get "update" => "articles#update"
  
  post "tags/:id" => "tags#tag"
  
  get 'home' => "pages#home"
  get 'about' => "pages#about"
  get 'contact' => "pages#contact"
  get 'sources/:source' => "pages#show_source"
  get 'profile' => 'pages#profile'
  get 'twitter' => 'pages#twitter'
  match '/auth/:provider/callback', to: 'sessions#create'
  
  get "login" => "sessions#new"
  get "logout" => "sessions#logout"
  post "/sessions" => "sessions#create"

  resources :users
  
end

