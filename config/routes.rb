Rails.application.routes.draw do
	root 'tasks#index'
	resources :tasks
	devise_for :users
	namespace :admin do
		# root :to => "users#index"
		resources :users
		resources :tasks
	end
	if Rails.env.production?
		mount Shrine.presign_endpoint(:cache) => "/presign"
	else
		mount Shrine.upload_endpoint(:cache) => "/upload"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
