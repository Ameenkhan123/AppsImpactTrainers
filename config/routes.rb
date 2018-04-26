Rails.application.routes.draw do
	root 'home#index'
	get 'index' => 'home#index'
	get 'home/charts'
	resources :home
	resources :tasks
	devise_for :users 
	devise_scope :user do
		get '/users/sign_out' => 'devise/sessions#destroy'
	end
	namespace :admin do
		resources :users
		resources :tasks
		resources :assignments
		# resources :dashboards
		get 'trainers' => 'dashboards#trainers'
		get 'dashboard' => 'dashboards#dashboard'
		get 'trainees' =>'dashboards#trainees'
	end
	namespace :trainer do
		resources :tasks
		resources :assignments
		get 'dashboard' => 'dashboards#dashboard'
		get 'trainees' =>'dashboards#trainees'
	end
	namespace :trainee do
		resources :tasks
	end
	if Rails.env.production?
		mount Shrine.presign_endpoint(:cache) => "/presign"
	else
		mount Shrine.upload_endpoint(:cache) => "/upload"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
