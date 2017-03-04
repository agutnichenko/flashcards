# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, :type => :feature do
  describe 'user controller methods' do

    it 'check that user can not update profile with too short password' do
      visit new_registration_path
      fill_in 'Email', with: 'blwvhwfdfdfdhmhmhntwkejbv@i.ua'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Create User'
      click_link 'Edit'
      fill_in 'Password', with: '12'
      fill_in 'Password confirmation', with: '12'
      click_button 'Update User'
      expect(page).to have_content 'Password is too short (minimum is 3 characters)'
    end

  end
end
