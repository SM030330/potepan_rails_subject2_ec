class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :startdate, presence: true
  validates :finishdate, presence: true
  validates :member_sum, presence: true,
                         numericality: true
  validate :start_is_after_finish
  validate :start_is_after_today

  def value_sum
    (self.room.value)*(self.member_sum)
  end

  def start_is_after_finish
    if startdate > finishdate
      errors.add(:base, '開始日は登録日より後に設定してください' )
    end
  end

  def start_is_after_today
    if startdate < Date.today
      errors.add(:base, '開始日は本日より後の日付で設定してください')
    end
  end
end
