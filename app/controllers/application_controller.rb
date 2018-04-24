class ApplicationController < ActionController::Base
	layout 'impact_backhand'
	protect_from_forgery with: :exception
	#before_action :configure_permitted_parameters, if: :devise_controller?
	# protected
	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :contact, :profile_image_data, :role) }
	# end
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden, content_type: 'text/html' }
			format.html { redirect_to main_app.root_url, notice: exception.message }
			format.js   { head :forbidden, content_type: 'text/html' }
		end
	end
end
