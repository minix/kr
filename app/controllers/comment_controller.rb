class CommentController < ApplicationController
	respond_to :js, :html

	def index
		@comment = Comment.all
		respond_to do |format|
			format.html # index.html.erb
			format.rss
		end
	end

	def create
		@comment = Comment.new(params[:comment])
		flash[:notice] = "Thanks for commenting!"
		respond_with(@comment, :layout => !request.xhr? )
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to comments_path }
			format.js
		end
	end

end
