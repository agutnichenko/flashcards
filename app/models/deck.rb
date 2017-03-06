class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards

  def current?
    if id == user.current_deck_id
      true
      else false
    end
  end
end
