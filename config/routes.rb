Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: :registrations }
  root to: 'ideas#index'
  resources :ideas
  resources :categories

  get '/about' => 'pages#about'
  get '/sitemap' => 'pages#sitemap'

  resources "contacts", only: [:new, :create]

end
