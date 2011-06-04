JustForScience::Application.routes.draw do
  root :to => 'launches#index'
  resources :launches
  resources :questions do
    member do
      get :vote_for
    end
  end

end
