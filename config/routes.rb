CapiwebRails::Application.routes.draw do
  resources :projects

  resources :deployments

  root :to => "projects#index"
end
