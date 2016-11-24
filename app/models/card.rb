class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true
  #railsssvalidates :review_date, presence: true
  before_create :is_automatically_set

  def is_automatically_set
    self.review_date = Time.new.to_s[0..-18] + (Time.new.day + 3).to_s
  end

end
