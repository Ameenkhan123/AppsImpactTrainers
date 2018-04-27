class Trainee::DashboardsController < ApplicationController 
	layout 'trainee'
	before_action :authenticate_user!
	def trainers
		@users = User.all
		@messages = Message.all
	end
	def dashboard		
	end

	

end
