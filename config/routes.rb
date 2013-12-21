MyGoalsApp::Application.routes.draw do

  resources :users
  resources :goals do
    resources :cheers, :only => :create
  end
  resource :session, :only => [:create, :new, :destroy]

end
