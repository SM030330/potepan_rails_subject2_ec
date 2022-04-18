class User < ApplicationRecord
  
  has_meny :rooms, 
  
  validates :name, lenght{ maximum:10 }
  validates :info, lenght{ maximum:250 }
  validates :email, presense: true,
                    uniqueness: true

  has_secure_password
  # allow_nillはhas_secure_passwordのエラー対策の為使用
  validates :password_digest, presense: true,
                              allow_nil: true, 
                              lenght: { minimum: 4}

  
end
