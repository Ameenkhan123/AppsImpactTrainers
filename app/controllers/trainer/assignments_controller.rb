class Trainer::AssignmentsController < ApplicationController
	layout 'trainer'
	before_action :authenticate_user!
	#load_and_authorize_resource
	def show
		@task = Task.find(params[:id])
		@users = User.all
	end
end