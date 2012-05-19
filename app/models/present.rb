class Present < ActiveRecord::Base
	has_one :photos
	validates_format_of :content_type, 
		with: /^image/
end
