class Bbsitter < ApplicationRecord
  has_many :reservations
  belongs_to :user
  mount_uploader :photo, PhotoUploader

end
