TimeTrack::Application.routes.draw do


  devise_for :users

  root :to => 'dashboard#show'
end
