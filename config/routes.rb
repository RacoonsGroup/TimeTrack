TimeTrack::Application.routes.draw do


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'dashboard#show'
  resources :time_entries
end
