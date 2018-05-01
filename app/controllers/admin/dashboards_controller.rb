class Admin::DashboardsController < ApplicationController 
	before_action :authenticate_user!
	layout 'impact_backhand'

	def trainees
		@users = User.all
		@messages = Message.all
	end

	def trainers
		@users = User.all
		@messages = Message.all
	end
	def dashboard
	@messages = Message.all		
	end
end
