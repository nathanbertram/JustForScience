JustForScience::Application.routes.draw do
  root :to => 'launches#index'
  resources :launches

end
