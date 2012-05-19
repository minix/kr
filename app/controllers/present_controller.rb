class PresentController < ApplicationController
	def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
		@photo = Photo.find(:all)
#		send_data(@show,
#			filename: @show.name,
#			type: @show.content_type,
#			disposition: "inline"
#		)
	end

	def show
		@photo = Photo.find(params[:id])
	end
	#def show_image
	#	show = Photo.find(params[:id])
	#	send_data @photo.large, :type => 'image/png', :disposition => 'inline'
	#end
	
end
