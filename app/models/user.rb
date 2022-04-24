class User < ApplicationRecord
  
  has_many :rooms
  
  validates :name, length: { maximum:10 }
  validates :info, length: { maximum:250 }
  validates :email, presence: true,
                    uniqueness: true

  has_secure_password
  # allow_nillはhas_secure_passwordのエラー対策の為使用
  validates :password, presence: true,
                       allow_nil: true, 
                       length: { minimum: 4}

  
end
