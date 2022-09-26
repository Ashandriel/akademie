Rails.application.routes.draw do
  mount SimpleFormMarkdownEditor::Engine => "/"

  # Clearance routes and config
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  #resources :users, controller: "users" do
   # resource :password,
    #controller: "clearance/passwords",
    #only: [:create, :edit, :update]
  




  resources :users, controller: "clearance/users", only: [:index, :create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :create, :update, :destroy, :new, :edit]
    resources :articles, only: [:show, :index, :create, :update, :destroy, :new, :edit]
    root to: 'dashboard#index'
    
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  #END Clearance
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studiengang', to: 'pages#studiengang', as: 'studiengang'
  get '/impressum', to: 'pages#impressum', as: 'impressum'
  get '/lehrgang', to: 'pages#lehrgang', as: 'lehrgang'
  get '/lehrgang-online', to: 'pages#lehrgang_online', as: 'lehrgang-online'
  get '/lehrgang-praesenz', to: 'pages#lehrgang_praesenz', as: 'lehrgang-praesenz'
  get '/construction', to: 'pages#construction', as: 'construction'
  get '/portrait_michael', to: 'pages#portrait_michael', as: 'portrait_michael'
  get '/portrait_antje', to: 'pages#portrait_antje', as: 'portrait_antje'
  get '/medien-plus', to: 'pages#medien_plus', as: 'medien-plus'
  get '/michaelis-interview', to: 'pages#michaelis_interview', as: 'michaelis-interview'
  get '/allesdichtmachen', to: 'pages#allesdichtmachen', as: 'allesdichtmachen'
  get '/zeitalter-des-ueberwachungskapitalismus', to: 'pages#zeitalter_des_ueberwachungskapitalismus', as: 'zeitalter-des-ueberwachungskapitalismus'
  get '/versagen-der-justiz', to: 'pages#versagen_der_justiz', as: 'versagen-der-justiz'
  get '/user-administration', to: 'pages#user_administration', as: 'user-administration'
  get '/klassenzimmer', to: 'pages#classroom', as: 'classroom'

  #get '/klassenzimmer', to: 'classroom#index', as: 'classroom'
  
  root to: 'pages#index'
end
