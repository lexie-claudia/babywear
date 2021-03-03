Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles
  get 'my_articles', to: 'articles#my_articles'
  get 'my_rentals', to: 'articles#my_rentals'
  resources :articles, only: [] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update] do
    patch :deny, on: :member
    patch :accept, on: :member
  end
  get 'my_bookings', to: 'bookings#my_bookings'
end
