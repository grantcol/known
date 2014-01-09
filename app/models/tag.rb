class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :links, through: :taggings
	attr_accessible :name
	
	def to_s
    	name
  	end
end
