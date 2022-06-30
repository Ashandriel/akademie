Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studiengang', to: 'pages#studiengang', as: 'studiengang'
  get '/impressum', to: 'pages#impressum', as: 'impressum'
  get '/construction', to: 'pages#construction', as: 'construction'
  root to: 'pages#index'
end
