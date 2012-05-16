require 'base64'
require 'mini_magick'
include MiniMagick
class Photo < ActiveRecord::Base
	validates_format_of :content_type,
		with: /^image/,
		message: "--- Must upload photo"

	def uploaded_photo=(photo_field)
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

	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end
end
