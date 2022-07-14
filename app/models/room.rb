class Room < ApplicationRecord

  has_many :user_rooms,dependent: :destroy
  has_many :messages,dependent: :destroy
  has_many :users, through: :user_rooms
  # accepts_nested_attributes_for :user_rooms

  validates :name,presence: true
end
