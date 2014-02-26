TimeTrack::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :projects
  resources :notifications
  resources :time_entries

  resources :articles, only: [:index, :new, :create] do
    member { get :toggle_read }
  end

  root :to => 'dashboard#show'

  resources :statistics, only: [:index] do
    get :download , on: :collection
  end
  namespace :api do
    resources :time_entries
    resources :articles
    resources :projects, only: [:index]
  end

  resources :time_points, only: [:update], :as => 'time_points'
end
