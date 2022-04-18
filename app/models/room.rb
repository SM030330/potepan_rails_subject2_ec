class Room < ApplicationRecord

  validates :name, lenght{ maximum:10 }

  validates :info, lenght{ maximum:250 }

  validates :value, uniqueness: true,

end
