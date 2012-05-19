class PresentController < ApplicationController
	def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
		@photo = Photo.find(:all)
	end
	
end
