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
      errors.add(:base, I18n.t('uniqueness'))
    end
  end

  def self.get_random
    @random_card = Card.order('RANDOM()').first
  end

end
