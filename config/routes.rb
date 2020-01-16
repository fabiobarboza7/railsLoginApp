Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#index', as: :sign_in
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboards#index' 
end
