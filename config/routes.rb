Rails.application.routes.draw do
  resources :information

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :top
    resources :users

    root to: 'top#index'
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
    #:sessions => 'users/sessions'
  }
=begin
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
=end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  get 'top/show'
end
