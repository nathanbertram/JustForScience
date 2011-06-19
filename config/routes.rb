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
  
  match '/make_suggestion' => 'suggestions#new', :as => :make_suggestion
  match '/sponsor_science' => 'suggestions#new', :as => :sponsor_science, :sponsor => 'science'
  
end
