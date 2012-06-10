class LikeController < ApplicationController
	def create
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
		@like = Like.new(params[:like])
		@like.like_user = @user.name
		respond_to do |form|
			if @like.save
				form.html { reditect_to controller: "present", action: "index" }
				format.js { render :layout => false }
				format.json { render :json => @reply } # this
			else
				format.html { render :new }
				format.js { render :layout => false, :status => 406  }
				format.json { render :json => {:errors => @reply.errors.full_messages.join(',')} } 
			end
		end
	end
end
