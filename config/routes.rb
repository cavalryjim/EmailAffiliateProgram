Prelaunchr::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  # JDavis: root_path should be the last of the named paths listed 
  #  unless there is a good reason to put other paths below it.
  root :to => "users#new"

  post 'users/create' => 'users#create'
  get 'refer-a-friend' => 'users#refer'
  get 'privacy-policy' => 'users#policy'

  unless Rails.application.config.consider_all_requests_local
    get '*not_found', to: 'users#redirect', :format => false
  end
end
