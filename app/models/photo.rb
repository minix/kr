#require 'mini_magick'
require 'base64'
require 'rmagick'
class Photo < ActiveRecord::Base
	validates_format_of :content_type, 
											with: /^image/,
											message: "--- Must upload photo"

	def uploaded_photo=(photo_field)
		self.name							= base_part_of(photo_field.original_filename)
		self.content_type			= photo_field.content_type.chomp
		img = Magick::Image.read(Base64.encode64(photo_field.read)).first
		unless img.nil?
			img.change_geometry!('240x320') do |cols, rows, image|
				if cols < img.columns or rows < img.rows then
					image.resize!(cols, rows)
				end
			end
		end
		self.data							= photo_field
		#GC.start
	end

	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end
end
