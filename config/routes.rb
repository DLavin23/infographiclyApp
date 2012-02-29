InfographiclyApp::Application.routes.draw do
 
  get "login" => "sessions#new"
  get "logout" => "sessions#logout"
  post "/sessions" => "sessions#create"

  resources :users
  
end

