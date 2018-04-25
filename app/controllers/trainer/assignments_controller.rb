class Trainer::AssignmentsController < ApplicationController
	before_action :authenticate_user!
	#load_and_authorize_resource
	# layout 'impact_backhand'
	def show
		@task = Task.find(params[:id])
		@users = User.all
	end
end