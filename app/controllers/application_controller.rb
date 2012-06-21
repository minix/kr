class ApplicationController < ActionController::Base
  protect_from_forgery
	layout "loginandsignup", only: [:login, :signup]

	def current_user
		if session[:user]
			@user = session[:user]
		end
	end
end
