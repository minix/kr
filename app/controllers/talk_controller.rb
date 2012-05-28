class TalkController < ApplicationController
  def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
		@t = Talk.find(:all)
  end

	def talk
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
		@talk = Talk.new(params[:talk])
		@talk.user_name = @user.name 
	 	if @talk.save
	 		flash[:notice] = "Post Success! "
			redirect_to controller: "talk", action: "index"
	 	end
	end

	def destroy
		@talk = Talk.find(params[:id])
		@talk.destroy
		redirect_to controller: "talk", action: "index"
	end

	def modify
		 @talk = Talk.find(params[:id])
	end
end
