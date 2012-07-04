class UserController < ApplicationController
  def signup
		@user = User.new(params[:user])
		if request.post?
			if @user.save
				session[:user] = User.authenticate(@user.name, @user.password)
				flash[:notice] = "Signup success"
				flash[:color] = "valid"
				redirect_to controller: "present", action: "index"
			else
				flash[:warning] = "Signup Unsuccessful"
				flash[:color] = "invalid"
			end
		end
  end

  def login
		if request.post?
			if session[:user] = User.authenticate(params[:user][:name], params[:user][:passwd])
				flash[:notice] = "login successful"
				flash[:color] = "valid"
				redirect_to controller: "present", action: "index"
			else
				flash[:warning] = "Invalid Username or Password"
				flash[:color] = "invalid"
				render "login"
			end
		end
  end

  def logout
		session[:user] = nil
		flash[:message] = 'Loged out'
		redirect_to controller: "present", action: "index"
  end

  def forget
		if request.post?
			u = User.find_by_email(params[:user][:email])
			if u and u.send_new_password
				flash[:message] = "A new password has been send by email"
				redirect_to action: "login"
			else
				flash[:warning] = "Couldn't send password"
			end
		end
  end

	def change_password
		@user = session[:user]
		if request.post?
			@user.update_attributes(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
			if @user.save
				flash[:message] = "password changed"
			end
		end
	end
end
