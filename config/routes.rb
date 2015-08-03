# -*- encoding : utf-8 -*-
Photocross::Application.routes.draw do

  resources :feedbacks


  resources :banners


  resources :banner_imgs


  mount Ckeditor::Engine => '/ckeditor'

  resources :secrets
  resources :finishes
  resources :starts
  resources :pressrelises
  resources :smis
  resources :partners
  resources :prizes
  resources :cards
  match 'activate' => 'cards#activate', :as => :activate
  resources :comments
  resources :notes
  resources :photos
  resources :tasks
  resources :articles
  resources :photo_categories
  resources :event_photos
  match 'pages/:page' => 'articles#page', :as => :page
  resources :teams
  match '/teams/profile/:id' => 'teams#profile'
  match '/events/gallery' => 'events#gallery'
  match '/events/gallery/:year' => 'events#gallery', :as => :gallery, :defaults => { :year => '2013' }
  match 'events/:id/photos/:category' => 'events#user_photos', :as => :event_user_photos
  resources :events do    
    resources :teams
    resources :tasks
  end

  resources :team_users do
    get :reject, :on => :member
    get :accept, :on => :member    
    # member do
    #   any :reject
    #   any :accept
    # end  
  end

  resources :users
  match 'admin' => 'admin#index', :as => :admin
  namespace :admin do
      resources :events do
        resources :teams
        member do
          get :gallery
        end
      end
      resources :notes
      resources :users
      resources :articles
  end

  resource :user_sessions
  resources :password_resets
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  mount Ckeditor::Engine => "/ckeditor"    
  match 'default' => 'articles#default', :as => :asp
  match 'news' => 'articles#default', :as => :asp  
  match ':name' => 'events#show', :as => :view_page
  root :to => 'welcome#index',  :locale => :ru
  match 'default' => 'articles#default', :as => :asp
  match 'news' => 'articles#default', :as => :asp
  match '/:controller(/:action(/:id))'
end
