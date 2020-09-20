Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events do
    resources :attendees
  end
  resources :events do
    member do
      get :group
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
