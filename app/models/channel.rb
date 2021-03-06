class Channel < ActiveRecord::Base
	belongs_to :user
	has_many :links
	validates :user_id, presence: true
	attr_accessible :user_id, :name, :description, :topics

end
