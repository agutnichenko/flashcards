# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CardsController, :type => :feature do
  describe "card controller methods" do

    it "check_uniqueness" do
      visit registrations_new_path
      fill_in 'Email', with: 'blwvhwbvlwfdfdfdhmhmhntgbvwjbvwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Create User'
      fill_in 'Email', with: 'blwvhwbvlwfdfdfdhmhmhntgbvwjbvwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      click_button 'Login'
      click_link 'Add card'
      fill_in 'original word', with: 'qwerty'
      fill_in 'translated word', with: 'qwerty'
      click_button 'Create flashcard'
      expect(page).to have_current_path(cards_path)
    end

  end
end