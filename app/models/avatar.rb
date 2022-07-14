class Avatar < ApplicationRecord
  belongs_to :user

  
  # validates :image, presence: true
  #これは多分、avatarの:imageには保存されないからバリデーションに引っかかってた。mount_uploaderを記述したせい
  mount_uploader :image, ImageUploader
end
