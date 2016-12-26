require "rails_helper"

RSpec.describe Card, :type => :model do
  it "check uniqueness" do
    card = Card.new(original_text: "ds", translated_text: "ds")
    expect(card.check_uniqueness).to include "translated text should not be equal to original one"
  end

  it "check_date method" do
    card = FactoryGirl.create(:card)
    expect(card.review_date).to eq(3.days.from_now)
  end

  it "check random method" do
    card = FactoryGirl.create(:card)
    expect(card.id).not_to be NIL
  end

end

