Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
