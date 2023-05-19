Rails.application.routes.draw do
  devise_for :users
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resources :comments
  end

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end  

  root to: "home#index"
end
