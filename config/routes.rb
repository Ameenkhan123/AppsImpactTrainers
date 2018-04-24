Rails.application.routes.draw do
	root 'home#index'
	get 'home/charts'
	get 'home/index'
	resources :home
	resources :tasks
	devise_for :users
	namespace :admin do
		resources :users
		resources :tasks
		resources :assignments
	end
	if Rails.env.production?
		mount Shrine.presign_endpoint(:cache) => "/presign"
	else
		mount Shrine.upload_endpoint(:cache) => "/upload"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
