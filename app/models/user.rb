class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :user_rooms
	has_many :rooms, through: :user_rooms
  has_many :messages
  mount_uploader :avatar, AvatarUploader
  validates :email, presence:true
  #has_many :notifications


  has_many :views
  has_many :notifications, through: :views
end
