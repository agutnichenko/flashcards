require "rails_helper"

RSpec.describe Card, :type => :model do
  it "check uniqueness" do
    card = Card.new(original_text: "ds", translated_text: "ds")
    expect(card.check_uniqueness).to include "translated text should not be equal to original one"
  end

end

