class ProfileController < ApplicationController
	def index
		@username = User.select(:name)
	end
end
