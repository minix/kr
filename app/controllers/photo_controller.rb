class PhotoController < ApplicationController
	def get
		@photo = Photo.new
	end

	def save
		@photo = Photo.new(params[:photo])
		if @photo.save
			redirect_to(action: 'show', id: @photo.id)
		else
			render(action: :get)
		end
	end

	def photo
		@photo = Photo.find(params[:id])
		begin
			send_data(@photo.original,
								filename: @photo.name,
								type: @photo.content_type,
								disposition: "inline")
		rescue
			print "Error! "
		end
	end
	def photo_large
		@photo = Photo.find(params[:id])
		send_data(@photo.large,
							filename: @photo.name,
							type: @photo.content_type,
							disposition: "inline")
	end
	def photo_thumbnail
		@photo = Photo.find(params[:id])
		send_data(@photo.thumbnail,
							filename: @photo.name,
							type: @photo.content_type,
							disposition: "inline")
	end

	def show
		@photo = Photo.find(params[:id])
	end
end
