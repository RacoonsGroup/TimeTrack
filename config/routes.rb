TimeTrack::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :time_entries
  resources :articles, only: [:index, :new, :create] do
    member { get :toggle_read }
  end

  root :to => 'dashboard#show'

  get "/statistic" => "statistic#index", :as => :statistic_index
end
