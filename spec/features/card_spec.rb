require 'rails_helper'

RSpec.describe CardsController, :type => :feature do
  describe "card controller methods" do

    it "check_uniqueness" do
      visit new_card_path
      fill_in 'original_text', with: 'qwerty'
      fill_in 'translated_text', with: 'qwerty'
      click_button 'Sign in'
      expect(response).to render_template("new")
    end

  end
end