MyGoalsApp::Application.routes.draw do

  resources :users
  resources :goals
  resource :session, :only => [:create, :new, :destroy]

end
