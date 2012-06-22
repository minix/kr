class PresentController < ApplicationController
	def index
		#if session[:user]
		#	@user = User.find_by_id(session[:user])
		#end
		current_user
		@photo = Photo.find(:all, :select => 'id')
	end

	def show
		@photo = Photo.find(params[:id])
		if current_user
			@username = current_user
			@comment = Comment.new(params[:comment])
			@comment.present_id = @photo.id
			@comment.username = User.find_by_id(current_user).name
			if @comment.save
				@comment.comment_content = nil
			end
		end
		@all_comment = Comment.where(:present_id => @photo)
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to controller: "present", action: "index"
	end

protected

def find_user(user_id)
	User.find_by_id(user_id)
end


end
