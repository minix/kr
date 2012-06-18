require 'mini_magick'
#include Magick
include MiniMagick
class Photo < ActiveRecord::Base
	belongs_to :presents

	validates_format_of :content_type,
		with: /^image/,
		message: "--- Must upload photo"

	def uploaded_photo=(photo_field)
		self.name							= base_part_of(photo_field.original_filename)
		self.content_type			= photo_field.content_type.chomp
		img = MiniMagick::Image.read(photo_field.read) 
		unless img.nil?
			img_original = img
			self.original = img_original.to_blob
			img_large = img
			img_large_w = (img_large[:width] * 0.5).to_i
			img_large_h = (img_large[:height] * 0.5).to_i
			img_large.resize("#{img_large_w}x#{img_large_h}")
			self.large = img_large.to_blob
			img_thumbnail = img
			img_thumbnail_w = (img[:width] * 0.2).to_i
			img_thumbnail_h = (img[:height] * 0.2).to_i
			img_thumbnail.resize("#{img_thumbnail_w}x#{img_thumbnail_h}")
			self.thumbnail = img_thumbnail.to_blob
		end
	end

	def base_part_of(file_name)
		File.basename(file_name).gsub(/[^\w._-]/, '')
	end
	 def string_to_binary(value)
		 return "data:#{file_type(value)};base64," + Base64.encode64(value)
	 end
	 #def file_type(file)
	 #  return file.content_type.chomp
	 #end
end
