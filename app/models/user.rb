class User < ApplicationRecord

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :cards
  has_many :decks
  #, :authentications, :dependent => :destroy
  #accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  def reset_current_state2(deck)
     update_attribute(:current_deck_id, deck.id)
  end

  def set_current_state2
     update_attribute(:current_deck_id, nil)
  end

end
