class User < ApplicationRecord
 validates :title, presence: true, length: {maximum: 20}
 validates :start_date, presence: true
 validates :end_date, presence: true
 validates :memo, length: {maximum: 500}
 
 validate :end_date_cannot_be_in_the_past
 def end_date_cannot_be_in_the_past
  if end_date.present? && start_date.present?
   if end_date < start_date
    errors.add(:end_date, "開始日より前の日付は使えません")
   end
  end
 end
end
