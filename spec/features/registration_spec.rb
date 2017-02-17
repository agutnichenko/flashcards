# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RegistrationsController, :type => :feature do
  describe 'session controller methods' do

    it 'check that user can login with valid credentials' do
      visit root_path
      click_link 'Register'
      fill_in 'Email', with: 'blwvhwfdfdfdhmhmhntwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Create User'
      expect(page).to have_content 'Cards'
    end

  end
end