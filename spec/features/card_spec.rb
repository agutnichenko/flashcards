# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CardsController, :type => :feature do
  describe 'card controller methods' do

    it 'check_uniqueness' do
      visit new_registration_path
      fill_in 'Email', with: 'blwvhwfdfdfdhmhmhntwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Create User'
      click_link 'Add card'
      fill_in 'original text', with: 'qwerty'
      fill_in 'translated text', with: 'qwerty'
      click_button 'Create Card'
      expect(page).to have_current_path(cards_path)
    end

    it 'check_xpath' do
      visit new_registration_path
      fill_in 'Email', with: 'blwvhwfdfdfdhmhmhntwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Create User'
      click_link 'Add card'
      expect(page).to have_xpath '//*[@id="card_avatar"]'
    end
  end
end
