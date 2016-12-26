class Card < ApplicationRecord

  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  validate :check_uniqueness
  validates_uniqueness_of :id
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
    Card.where("review_date <= ?", Time.current).order('RANDOM()').first
  end

  # def check_for_equality
  #   unless Card.include?(self)
  #     errors.add(:base, "card is already existing")
  #   end
  # end

  # def check_for_equality
  #   @cards = Card.all
  #   unless self(params[:original_text]) == Card.find(original_text)
  #     errors.add(:base, "card is already existing")
  #   end
  # end

end
