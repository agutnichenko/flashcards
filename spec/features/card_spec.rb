require 'rails_helper'

RSpec.describe CardsController, :type => :feature do
  describe "card controller methods" do

    it "check_uniqueness" do
      visit new_card_path
      fill_in 'original word', with: 'qwerty'
      fill_in 'translated word', with: 'qwerty'
      click_button 'Create flashcard'
      expect(page).to have_current_path(cards_path)
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
end