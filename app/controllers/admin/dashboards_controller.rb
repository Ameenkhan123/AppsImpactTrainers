class Admin::DashboardsController < ApplicationController 
	before_action :authenticate_user!
	layout 'impact_backhand'

	def trainees
		@users = User.all
	end

	def trainers
		@users = User.all
	end
	def dashboard		
	end
end
