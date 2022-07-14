# frozen_string_literal: true

class User < ActiveRecord::Base
  # include Rails.application.routes.url_helpers
  # ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User
  

  mount_uploader :image, ImageUploader
  has_many :user_rooms, dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :messages,dependent: :destroy
  has_many :rooms, through: :user_rooms



  validates :name, presence: true
  validates :name, length: { maximum: 30 }


 
end
