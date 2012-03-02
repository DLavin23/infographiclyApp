InfographiclyApp::Application.routes.draw do
 
  root :to => "pages#home"
 
  get 'home' => "pages#home"
  get 'about' => "pages#about"
  get 'contact' => "pages#contact"

  
  get "login" => "sessions#new"
  get "logout" => "sessions#logout"
  post "/sessions" => "sessions#create"

  resources :users
  
end

