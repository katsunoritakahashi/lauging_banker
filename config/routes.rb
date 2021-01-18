Rails.application.routes.draw do
  root 'users#new'
  get '/static_pages/privacy_policy', to: 'static_pages#privacy_policy'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: %i[new create index destroy]
  resources :investments, only: %i[new create show index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
