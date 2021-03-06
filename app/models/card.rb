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
    # self.review_date ||= 3.days.from_now
    self.review_date ||= Time.now
  end

  def check_uniqueness
    unless self.original_text.downcase != self.translated_text.downcase
      errors.add(:base, I18n.t('uniqueness'))
    end
  end

  def self.get_random
    Card.where('review_date <= ?', Time.current).order('RANDOM()').first
  end

  def self.send_notification
    users = User.joins(:cards).where('cards.review_date <= ?', Time.current)
    users.each do |user|
      CardsMailer.pending_cards_notification(user).deliver_now
    end
  end

end
