Rails.application.routes.draw do
	root 'home#index'
	get 'index' => 'home#index'
	get 'home/charts'
	resources :home
	resources :tasks
	devise_for :users
	namespace :admin do
		resources :users
		resources :tasks
		resources :assignments
		# resources :dashboards
		get 'trainers' => 'dashboards#trainers'
		get 'dashboard' => 'dashboards#dashboard'
		get 'trainees' =>'dashboards#trainees'
	end
	if Rails.env.production?
		mount Shrine.presign_endpoint(:cache) => "/presign"
	else
		mount Shrine.upload_endpoint(:cache) => "/upload"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
