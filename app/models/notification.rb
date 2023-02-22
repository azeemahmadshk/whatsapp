class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :room
	
	has_many :views
	has_many :users, through: :views
end
