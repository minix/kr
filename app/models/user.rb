class User < ActiveRecord::Base
		require 'digest/sha1'

		EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

		has_many :likes
		belongs_to :kr

		validates_presence_of :email, :password, :password_confirmation, :salt
		validates_uniqueness_of :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
		# validates_length_of :within => 3..40
		validates_length_of :password, :within => 6..40

		attr_accessor :password_confirmation
		attr_protected :id, :salt
		validates_confirmation_of :password

		def password
			@password
		end

		def password=(pass)
			@password = pass
			self.salt = User.random_string(10) if !self.salt?
			self.hash_passwd = User.encrypt(@password, self.salt)
		end


#		def self.authenticate(name, password)
#			u = find(:first, conditions: ["name = ?", name])
#			#u = find(:first, :conditions => { :email => "#{email}" })
		def self.authenticate(name_or_email, password)
			if EMAIL_REGEX.match(name_or_email)
				u = User.find_by_email(name_or_email)
			else
				u = User.find_by_name(name_or_email)
			end
			return nil if u.nil?
			return u if User.encrypt(password, u.salt) == u.hash_passwd
			nil
		end

		def send_new_password
			new_pass = User.random_string(10)
			self.password = self.password_confirmation = new_pass
			self.save
			Notifications.deliver_forgot_password(self.email, self.name, new_pass)
		end

		protected

		def self.encrypt(pass, salt)
			Digest::SHA1.hexdigest(pass+salt)
		end

		def self.random_string(len)
			chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
			newpass = ""
			1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
			return newpass
		end
end
