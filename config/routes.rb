Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :links, only: [:show, :new, :create]
  root :to => "links#new", as: :home
  get ':slug' => 'links#show'
  get '*path', :to => 'application#routing_error'
end
