JustForScience::Application.routes.draw do
  root :to => 'questions#index'
  resources :suggestions
  resources :questions do
    member do
      get :vote_for
    end
    
    collection do
      get :random
    end
  end

end
