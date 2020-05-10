class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!, except: [:home, :about]



	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :postal_code, :prefecture, :city, :street])
	end

	def after_sign_in_path_for(resource)
		user_path(resource)
	end

	def after_sign_up_path_for(resource)
		user_path(resource)
	end


end
