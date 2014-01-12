class Message < ActiveRecord::Base
	belongs_to :user
	validates :sender_id, presence: true
	validates :recipient_id, presence: true

	attr_accessible :sender_id, :recipient_id, :text, :link_id
end
