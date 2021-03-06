Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studiengang', to: 'pages#studiengang', as: 'studiengang'
  get '/impressum', to: 'pages#impressum', as: 'impressum'
  get '/lehrgang', to: 'pages#lehrgang', as: 'lehrgang'
  get '/construction', to: 'pages#construction', as: 'construction'
  get '/portrait_michael', to: 'pages#portrait_michael', as: 'portrait_michael'
  get '/portrait_antje', to: 'pages#portrait_antje', as: 'portrait_antje'
  root to: 'pages#index'
end
