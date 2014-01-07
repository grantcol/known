class User < ActiveRecord::Base
	include UsersHelper

	has_many :members
	has_many :groups, through: :memnbers 

	has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }
  	attr_accessible :email, :password, :password_confirmation, :first, :last, 
  					:image_file_name, :image_content_type, :image_file_size,
 					:image_updated_at
 					
  	attr_accessor :password
  	before_save :encrypt_password
  
  	validates_confirmation_of :password
  	validates_presence_of :password, :on => :create
  	validates_presence_of :email
  	validates_uniqueness_of :email

  	def self.authenticate(email, password)
	    user = find_by_email(email)
	    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	      user
	    else
	      nil
	    end
	end
	def encrypt_password
	    if password.present?
	      self.password_salt = BCrypt::Engine.generate_salt
	      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	    end
  	end
end
