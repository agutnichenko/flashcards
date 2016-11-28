class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  validate :check_uniqueness
  before_validation :is_automatically_set

  def is_automatically_set
    self.review_date ||= 3.days.from_now
  end

  def check_uniqueness
    unless self.original_text.downcase != self.translated_text.downcase
      #errors.add(:base, 'translated text should not be equal to original one')
      #t('uniqueness')
    end
  end

end
