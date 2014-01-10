class User < ActiveRecord::Base
	include UsersHelper
	has_many :links, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id",
                                   	 class_name:  "Relationship",
                                     dependent:   :destroy
 	has_many :followers, through: :reverse_relationships, source: :follower
	has_many :members
	has_many :groups, through: :members 
	has_attached_file :image , #styles: { medium: "300x300>", thumb: "50x50>" },
	                  :url  => "/assets/users/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  	attr_accessible :email, :password, :password_confirmation, :first, :last, 
  					:image, :handle

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

  	def following?(other_user)
	    relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
	    relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
    	relationships.find_by(followed_id: other_user.id).destroy!
  	end

  	def feed
  		Link.from_users_followed_by(self)
  	end
end
