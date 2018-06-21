class Bbsitter < ApplicationRecord

  include PgSearch
  pg_search_scope :search_by_first_name_and_experience,
      against: [ :first_name, :experience ],
     using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


  has_many :reservations
  belongs_to :user
  mount_uploader :photo, PhotoUploader

end
