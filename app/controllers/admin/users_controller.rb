class Admin::UsersController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource 
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	layout 'impact_backhand'
	
	def index
		@users = User.all
	end

	
	def show
		@user = User.find(params[:id])
	end

	
	def new
		@user = User.new
	end

	def edit
	end

	
	def create
		#@user = User.new(user_params)
		if @user.save
			redirect_to [:admin, @user]
		else
			render :new
		end
	end


	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to  [:admin, @user], notice: 'user was successfully updated.' }
				format.json { render :show, status: :ok, location: [:admin, @user] }
			else
				format.html { render :edit }
				format.json { render json: [:admin, @user].errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to admin_users_url, notice: 'user was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def resource_params
		params.require(:user).permit(:name , :contact, :profile_image, :profile_image_data, :role, :email, :password, :password_confirmation)
	end
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:name , :contact, :profile_image, :profile_image_data, :role, :email, :password, :password_confirmation)
	end
end
