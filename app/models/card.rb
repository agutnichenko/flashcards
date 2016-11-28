class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  before_validation :is_automatically_set

  def is_automatically_set
    self.review_date = 3.days.from_now
  end

end
