# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SessionsController, :type => :feature do
  describe 'session controller methods' do

    it 'check that user can login with valid credentials' do
      visit root_path
      fill_in 'Email', with: 'quo_vadis@i.ua'
      fill_in 'Password', with: '123456'
      click_button 'Login'
      expect(page).to have_content 'Login successful'
    end

    it 'check that user can not login with invalid credentials' do
      visit root_path
      fill_in 'Email', with: 'quo_vadis@i.ua'
      fill_in 'Password', with: '1234568910'
      click_button 'Login'
      expect(page).to have_content 'Register | Login'
    end

  end
end