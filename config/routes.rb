TimeTrack::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :projects
  resources :time_entries do
  end

  resources :articles, only: [:index, :new, :create] do
    member { get :toggle_read }
  end

  root :to => 'dashboard#show'

  resources :statistics, only: [:index] do
    get :download_pdf , on: :collection

  end

  namespace :api do
    resources :time_entries
    resources :articles
  end

end
