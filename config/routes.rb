Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :microposts
  resources :users
  # root 'application#hello'

  get 'hello' => 'application#hello'

  # root 'users#index'
end
