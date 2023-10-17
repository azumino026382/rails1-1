class Schedule < ApplicationRecord
  validates :title, presence: { message: "タイトルを入力してください"}
  validates :start, presence: { message: "開始日を入力してください"}
  validates :end, presence: { message: "終了日を入力してください"}
  validates :title, length: { maximum: 20 }
  validates :memo, length: { maximum: 500 }
  validate :start_check

  def start_check
    if self.start.present? && self.end < Date.today
      errors.add(:end, "過去の日付は使えません")
    end      
  end

end

