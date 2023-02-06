class Message < ApplicationRecord
	belongs_to :room
	belongs_to :user
	has_many_attached :images
	scope :search_messages, ->(room_id,text) { Room.find_by_id(room_id).messages.where("description LIKE ?", "%#{text}%") }
	validates :description, presence:true

end
