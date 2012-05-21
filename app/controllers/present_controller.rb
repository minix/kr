class PresentController < ApplicationController
	def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
		@photo = Photo.find(:all, :select => 'id')
	end

	def show
		@photo = Photo.find(params[:id])
		respond_to do |format|
			format.html
			format.xml { render xml:@photo }
		end
	end
	
end
