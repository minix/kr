class PresentController < ApplicationController
	respond_to :html, :js

	def index
		#if session[:user]
		#	@user = User.find_by_id(session[:user])
		#end
		current_user
		@photo = Photo.find(:all, :select => 'id')
	end

	def show
		@user = session[:user]
		@photo = Photo.find(params[:id])
		#@photo = Photo.first
		if current_user
			@username = current_user
			@comment = Comment.new(params[:comment])
			@comment.present_id = @photo.id
			@comment.username = User.find_by_id(current_user).name
			if @comment.save
				@comment.comment_content = nil
			end
		else
			flash[:notice] = "must login to comment"
		end
			@all_comment = Comment.where(:present_id => @photo)
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		respond_to do |format|
			format.js { render nothing: true }
		end
		#redirect_to controller: "present", action: "index"
	end

protected

def find_user(user_id)
	User.find_by_id(user_id)
end


end
