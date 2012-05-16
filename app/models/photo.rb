require 'base64'
require 'mini_magick'
#require 'rmagick'
#include Magick
include MiniMagick
class Photo < ActiveRecord::Base
	validates_format_of :content_type, 
											with: /^image/,
											message: "--- Must upload photo"

	def uploaded_photo=(photo_field)
		self.name							= base_part_of(photo_field.original_filename)
		self.content_type			= photo_field.content_type.chomp
		img = MiniMagick::Image.read(photo_field.read) 
		unless img.nil?
			img.resize("10x10")
			#img.change_geometry!('240x320') do |cols, rows, image|
			#	if cols < img.columns or rows < img.rows then
			#		image.resize!(cols, rows)
			#	end
			#end
		end
		GC.start
		self.data							= img.to_blob
	end

	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end
end
