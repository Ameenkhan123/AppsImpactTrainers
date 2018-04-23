class Admin::AssignmentsController < ApplicationController
	def show
		@task = Task.find(params[:id])
		@users = User.all
	end
end