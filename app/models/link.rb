class Link < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :votes
	attr_accessible :tag_list, :url, :title, :user_id
	validates :user_id, presence: true
	
	def tag_list
	  self.tags.collect do |tag|
	    tag.name
	  end.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end

	# Returns links from the users being followed by the given user.
	def self.from_users_followed_by(user)
	    followed_user_ids = "SELECT followed_id FROM relationships
	                         WHERE follower_id = :user_id"
	    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
	          user_id: user.id)
  	end
end