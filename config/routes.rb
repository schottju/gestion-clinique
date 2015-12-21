Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount PostgresqlLoStreamer::Engine => "/picture_image"
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      root 'users#show_profile', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get '/profile', to: 'users#show_profile'

#  get '/veterinarians', to: 'veterinarians#index'
#  get '/proprios/:id', to: 'proprios#proprio', as: 'proprio'
#  get '/proprios/:id/create', to: 'proprios#create_proprio', as: 'create_proprio'
#  get '/proprios/:id/edit', to: 'proprios#edit_proprio', as: 'edit_proprio'
#  patch '/proprios/:id/update', to: 'proprios#update_proprio', as: 'update_proprio'

  #Static pages
  get '/help_page', to: 'static_pages#help_page'
  get '/about', to: 'static_pages#about'

  #Dictionaries
  get '/dictionaries', to: 'static_pages#dictionaries'
  get '/units_search', to: 'static_pages#units_search'
  get '/species_search', to: 'static_pages#species_search'
  get '/diseases_search', to: 'static_pages#diseases_search'
  get '/treatments_search', to: 'static_pages#treatments_search'
  get '/medocs_search', to: 'static_pages#medocs_search'

  resources :units, only: [ :new, :create, :edit, :update ]
  resources :diseases, only: [ :new, :create, :edit, :update ]
  resources :treatments, only: [ :new, :create, :edit, :update ]
  resources :species, only: [ :new, :create, :edit, :update ]
  resources :medocs, only: [ :new, :create, :edit, :update ]

  resources :veterinarians, only: [ :index, :show, :new, :create, :edit, :update ]

  resources :proprios, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :animals , only: [ :index, :show, :new, :create, :edit, :update ]
    resources :medical_records, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :hospits, only: [ :index, :show, :new, :create, :edit, :update ]
    resources :pictures, only: [ :index, :show, :new, :create, :edit, :update ]
  end
  resources :users, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :veterinarians, only: [ :index, :show, :new, :create, :edit, :update ]
    get '/veterinarians', to: 'veterinarians#index_veterinarians'
    get '/veterinarians/:id/calendar', to: 'veterinarians#show_calendar', as: 'veterinarian_calendar'

  end
end
