class ApplicationController < ActionController::Base
  protect_from_forgery
	layout "loginandsignup", only: [:login, :signup]

end
