Rails.application.routes.draw do


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
    resources :columns, only: [:show, :index, :create, :update, :destroy, :new, :edit]
    resources :messages, only: [:show, :index, :create, :update, :destroy, :new, :edit]
    resources :tasks, only: [:show, :index, :create, :update, :destroy, :new, :edit]
    resources :forms, only: [:show, :index, :create, :update, :destroy, :new, :edit]
    resources :images, only: [:show, :index, :create, :update, :destroy, :new, :edit]
    resources :courses,  only: [:show, :index, :create, :update, :destroy, :new, :edit]
    root to: 'dashboard#index'
    
  end

  namespace :classroom do
    resources :task_articles, only: [:show, :index, :create, :update, :destroy, :new, :edit, :mein_bereich]
    get '/mein-bereich', to: 'mein_bereich#index', as: 'mein-bereich'
    get '/kommilitonen', to: 'kommilitonen#index', as: 'kommilitonen'
    root to: 'klassenzimmer#index'
  end  

  resources :columns, only: [:index, :show] do
    resources :articles, only: [:index]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  #END Clearance
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studiengang', to: redirect('kurse')
  get "/kurse", to: "pages#courses", as: :kurse
  get '/impressum', to: 'pages#impressum', as: 'impressum'
  get '/videos', to: 'pages#lehrgang', as: 'videos'
  get '/lehrgang', to: redirect('videos')
  get '/kolumnen', to: 'columns#overview', as: 'kolumnen' # Route für die Übersicht
  get '/lebensgeschichten', to: 'stories#index', as: :stories
  get '/newsletter', to: 'pages#newsletter', as: 'newsletter'
  get '/lehrgang-online', to: 'pages#lehrgang_online', as: 'lehrgang-online'
  get '/lehrgang-praesenz', to: 'pages#lehrgang_praesenz', as: 'lehrgang-praesenz'
  get '/construction', to: 'pages#construction', as: 'construction'
  get '/wer-wir-sind', to: 'pages#wer_wir_sind', as: 'wer-wir-sind'
  get '/aktuelle-kurse', to: 'pages#angebot_2023_2024', as: 'aktuelle-kurse'
  get '/angebot_2023_2024', to: redirect('aktuelle-kurse')
  #get '/medien-plus', to: 'pages#medien_plus', as: 'medien-plus'
  get '/michaelis-interview', to: 'pages#michaelis_interview', as: 'michaelis-interview'
  get '/allesdichtmachen', to: 'pages#allesdichtmachen', as: 'allesdichtmachen'
  get '/zeitalter-des-ueberwachungskapitalismus', to: 'pages#zeitalter_des_ueberwachungskapitalismus', as: 'zeitalter-des-ueberwachungskapitalismus'
  get '/versagen-der-justiz', to: 'pages#versagen_der_justiz', as: 'versagen-der-justiz'
  get '/user-administration', to: 'pages#user_administration', as: 'user-administration'
  get '/classroom', to: 'classroom#index', as: 'classroom'
  get '/unterstuetzen', to: 'pages#unterstuetzen', as: 'unterstuetzen'
  get "/suche", to: "articles#search", as: 'article_search'


  get '/tresen', to: 'medienplus#index', as: 'tresen'
  get '/medien-plus', to: redirect('tresen')

  resources :articles, only: [:index, :show], path: 'medien-plus' do



      

  


  end


  #get '/klassenzimmer', to: 'classroom#index', as: 'classroom'
  
  root to: 'pages#index'
end
