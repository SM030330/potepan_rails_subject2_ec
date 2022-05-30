class User < ApplicationRecord
  
  has_many :rooms, dependent: :destroy 
  has_many :reserves, dependent: :destroy
  has_many :reserved_room, through: :reserves,
                            source: :room

  validates :name, length: { maximum:10 },
                    presence: true
  validates :info, length: { maximum:250 }                    
  validates :email, presence: true,
                    uniqueness: true

  has_secure_password
  # allow_nillはhas_secure_passwordのエラー対策の為使用
  validates :password, presence: true,
                       allow_nil: true, 
                       length: { minimum: 4}

  has_one_attached :avatar

  def resize_avatar(user_avatar)
    unless self.avatar.attached?
      self.avatar.variant(resize_to_limit: [100, 100], 
                                    format: :jpeg, 
                                    saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 })   
    end
  end
end
