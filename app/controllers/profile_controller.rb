class ProfileController < ApplicationController
	def index
		@username = User.select(:name)
		current_user
	end

	def create
		@like = Like.new(params[:id])
	end
end
