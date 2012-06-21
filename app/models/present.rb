class Present < ActiveRecord::Base
	has_one :photos

	def find_user(userid)
		User.select(:name).where(:id => "userid")
	end
end
