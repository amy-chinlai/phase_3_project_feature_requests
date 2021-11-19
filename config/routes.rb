Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests, only: [:index, :show, :new, :create, :edit, :update, :delete] do 
    resources :votes, only: [:new, :create]
  end
  
  resources :users, only: [:new, :create, :destroy]
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'requests/:id/delete' => 'requests#destroy'

end
