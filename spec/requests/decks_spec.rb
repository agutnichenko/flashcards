require 'rails_helper'

RSpec.describe 'Decks', type: :request do
  describe 'GET /decks' do
    it 'decks redirects to all deckswith 302 code' do
      get decks_path
      expect(response).to have_http_status(302)
    end
  end
end
