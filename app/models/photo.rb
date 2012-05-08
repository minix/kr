class Photo < ActiveRecord::Base
#	require 'mini_magick'

	validates_format_of :content_type, 
											with: /^image/,
											message: "--- Must upload photo"

	def uploaded_photo=(photo_field)
		self.name							= base_part_of(photo_field.original_filename)
		self.content_type			= photo_field.content_type.chomp
		self.data							= photo_field.read
	end

	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end

	def crop_img
		img = MiniMagick2::Image.open(self.data)
		@corp = {:width => img[:width], :height => img[:height]}
	end
end
