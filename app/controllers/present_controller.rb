class PresentController < ApplicationController
<<<<<<< HEAD
	def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end

		@photo = Photo.find(params[:id])
	end

=======
>>>>>>> 1a60e95af2521db043be97f4e4abdebe99a612a6
end
