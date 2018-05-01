class Trainer::TasksController < ApplicationController
	layout 'trainer'
	load_and_authorize_resource
	before_action :authenticate_user!
	before_action :set_task, only: [:show, :edit, :update, :destroy]
	# layout 'impact_backhand'
	# GET /tasks
	# GET /tasks.json
	def index
		@tasks = Task.all   
		@q = Task.ransack(params[:q])
		@tasks = @q.result(distinct: true)
		@messages = Message.all
	end

	# GET /tasks/1
	# GET /tasks/1.json
	def show
		@task = Task.friendly.find(params[:id])
		@users = User.all
		@messages = Message.all
		# @task = Task.new
	end

	# GET /tasks/new
	def new
		@task = Task.new
		@messages = Message.all
	end

	# GET /tasks/1/edit
	def edit
	end

	# POST /tasks
	# POST /tasks.json
	def create
		@task = Task.new(task_params)

		respond_to do |format|
			if @task.save
				format.html { redirect_to [:admin, @task], notice: 'Task was successfully created.' }
				format.json { render :show, status: :created, location: [:admin, @task] }
			else
				format.html { render :new }
				format.json { render json: [:admin, @task].errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /tasks/1
	# PATCH/PUT /tasks/1.json
	def update
		respond_to do |format|
			if @task.update(task_params)
				format.html { redirect_to  [:admin, @task], notice: 'Task was successfully updated.' }
				format.json { render :show, status: :ok, location: [:admin, @task] }
			else
				format.html { render :edit }
				format.json { render json: [:admin, @task].errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /tasks/1
	# DELETE /tasks/1.json
	def destroy
		@task.destroy
		respond_to do |format|
			format.html { redirect_to admin_tasks_url, notice: 'Task was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def set_task
		@task = Task.friendly.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:title, :description, :user_id, :id, :slug)
	end
end
