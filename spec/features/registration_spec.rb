# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RegistrationsController, :type => :feature do
  describe 'registration controller methods' do

    it 'check that registartion with valid data' do
      visit root_path
      click_link 'Register'
      fill_in 'Email', with: 'blwvhwfdfdfdhmhmhntwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Create User'
      expect(page).to have_content 'Cards'
    end

    it 'check that registartion with mismatching passwords fails' do
      visit root_path
      click_link 'Register'
      fill_in 'Email', with: 'uiykjrtgwgwrgwrg'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '1234567'
      click_button 'Create User'
      expect(page).to have_content 'Password confirmation doesn\'t match Password'
    end
  end
end