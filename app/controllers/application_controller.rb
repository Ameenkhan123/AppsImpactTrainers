class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	def after_sign_in_path_for(resource)
		if resource.role == 'admin'
			admin_users_path
		elsif resource.role == 'trainer'
			trainer_tasks_path
		else
			trainee_tasks_path
		end
	end
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden, content_type: 'text/html' }
			format.html { redirect_to main_app.root_url, notice: exception.message }
			format.js   { head :forbidden, content_type: 'text/html' }
		end
	end
end
