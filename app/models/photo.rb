require 'base64'
require 'mini_magick'
<<<<<<< HEAD
=======
#require 'rmagick'
#include Magick
>>>>>>> 8c6c111fb7093cc4b9c8e7c472ccaa04b5a8545e
include MiniMagick
class Photo < ActiveRecord::Base
	validates_format_of :content_type,
		with: /^image/,
		message: "--- Must upload photo"

	def uploaded_photo=(photo_field)
<<<<<<< HEAD
		self.name = base_part_of(photo_field.original_filename)
		self.content_type = photo_field.content_type.chomp
		img = MiniMagick::Image.read(photo_field.read)
		img_original = img
		self.original = img_original.to_blob
		img_large = img
		img_large.resize("240x360")
		self.large = img_large.to_blob
		img_thumbnail = img
		img_thumbnail.resize("120x180")
		self.thumbnail = img_thumbnail.to_blob
	end
=======
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
eend
>>>>>>> 8c6c111fb7093cc4b9c8e7c472ccaa04b5a8545e

	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end
end
