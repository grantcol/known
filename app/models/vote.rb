class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :link
	#validates :user_id, presence: true
	validates :link_id, presence: true

	attr_accessible :user_id, :yn
end
