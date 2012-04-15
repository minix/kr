class KrController < ApplicationController
  def index
		if session[:user]
			@user = User.find_by_id(session[:user])
		end 
  end

  def about
  end

	def profile
	end

  def success
		@success_info = Pro.find(:all)
		cookies[:info] = { :value => params[:sender] }
  end

	def finish
		@finish = Pro.find(params[:id])
	end

	def edit_info

	end

	def destroy
		@delete_info = Pro.find(params[:id])
		@delete_info.destroy
		redirect_to :action => "success"
	end

	def talk
		@talk = Talk.new(params[:talker])
		@talk.save
#		if @talk.save
#			format.html { redirect_to :action => "talk", :notice => "haha" }
#			format.json { render :json => @sender, :status => :created, :locate => @sernder }
#		else
#			format.html { render :action => "talk" }
#			format.json { render :json => @sender.errors, :status => :unprocessable_entity }
#		end
	end

	def create
		@sender = Pro.new(params[:sender])
		# if :url !~ /^[http:\/\/|https:\/\/].*/
		# # :url => 'http://' + :url
		# # end
		
		respond_to do |format|
			if @sender.save
				flash[:notice] = "Create Success"
				#format.html { redirect_to(:active => "index", :notice => 'haha') }
				format.html { redirect_to :action => "success", :notice => "haha" }
				format.json { render :json => @sender, :status => :created, :locate => @sernder }
			else
				format.html { render :action => "index" }
				format.json { render :json => @sender.errors, :status => :unprocessable_entity }
			end
		end
	end
end
