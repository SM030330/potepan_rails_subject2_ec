class User < ApplicationRecord
  
  has_many :rooms, dependent: :destroy 

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

  def defalt_avatar
    unless self.avatar.attached?
      avatar =  self.avatar.variant(resize_to_limit: [100, 100], 
                                    format: :jpeg, 
                                    saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 })

      avatar.attach(io: File.open("app/assets/images/default_icon.jpg"), filename: "defalt_icon.jpg", content_type: "image/jpeg")             
    end
  end
end
