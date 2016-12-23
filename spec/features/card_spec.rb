require 'rails_helper'

RSpec.describe CardsController, :type => :feature do
  describe "card controller methods" do

    it "check_uniqueness" do
      visit new_card_path
      # fill_in 'card_original_text', with: 'qwerty'
      # fill_in 'card_translated_text', with: 'qwerty'
      fill_in 'original text', with: 'qwerty'
      fill_in 'translated text', with: 'qwerty'
      click_button 'Create flashcard'
      expect(page).to have_current_path(cards_path)
    end

  end
end