class Card < ApplicationRecord

  belongs_to :user
  belongs_to :deck

  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  validates :original_text, uniqueness: true
  validate :check_uniqueness
  before_validation :is_automatically_set

  mount_uploader :avatar, AvatarUploader

  def is_automatically_set
    self.review_date ||= 3.days.from_now
  end

  def check_uniqueness
    unless self.original_text.downcase != self.translated_text.downcase
      errors.add(:base, I18n.t('uniqueness'))
    end
  end

  def self.get_random
    Card.where('review_date <= ?', Time.current).order('RANDOM()').first
  end

end
