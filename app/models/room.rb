class Room < ApplicationRecord

  has_many :reserves
  has_many :reserve_users, through: :reserves,
                           source: :room
  
  has_one_attached :room_img

  validates :name, length:{ maximum:10 },
                    presence: true
  validates :info, length:{ maximum:250 },
                    presence: true
  validates :value, presence: true,
                    numericality: true
  validates :address, presence: true
  validates :room_img, presence: true

  
end
