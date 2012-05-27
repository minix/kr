class TalkController < ApplicationController
  def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end
  end
end
