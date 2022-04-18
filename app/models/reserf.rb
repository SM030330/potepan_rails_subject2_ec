class Reserf < ApplicationRecord

  validates :startdate, presense: true
  validates :finishdate, presense: true
  validates :member_sum, presense: true
end
