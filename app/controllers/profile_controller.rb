class ProfileController < ApplicationController
	def index
		@username = User.select(:name)
	end

	def create
		@like = Like.new(params[:id])
	end
end
