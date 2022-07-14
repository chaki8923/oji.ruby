class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room,optional: true
  has_many :likes

  validates :content,presence: true
end
