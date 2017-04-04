# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CardsController, type: :feature do
  describe 'internationalization' do

    it 'check language switch as unauthorized user' do
      visit root_path
      click_on 'ru'
      expect(page).to have_content('Первый в мире удобный менеджер флеш-карточек. Именно так.')
      click_on 'en'
      expect(page).to have_content('The very best vocabulary ever')
    end
  end
end
