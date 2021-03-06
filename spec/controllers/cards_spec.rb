require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET #index' do

    it 'responds successfully with an HTTP 200 status code' do
      user = FactoryGirl.create(:user)
      login_user(user)
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do

    it 'renders the show template if item found' do
      user = FactoryGirl.create(:user)
      login_user(user)
      card = FactoryGirl.create(:card, user: user)
      get :show, params: {id: card.id}
      expect(response).to render_template('show')
    end
  end

  describe 'POST #create' do

    it 'redirects to newly created card' do
      user = FactoryGirl.create(:user)
      login_user(user)
      post :create, params: {card: {original_text: 'as', translated_text: 'qw', user_id: user.id}}
      expect(response).to redirect_to(card_path(assigns(:card)))
    end

    it 'renders new view in case if translated_text field is empty' do
      user = FactoryGirl.create(:user)
      login_user(user)
      get :new
      post :create, params: {card: {original_text: 'as', translated_text: nil}}
      expect(response).to render_template('new')
    end

    it 'renders new view in case if original_text field is empty' do
      user = FactoryGirl.create(:user)
      login_user(user)
      get :new
      post :create, params: {card: {translated_text: 'asy', original_text: nil}}
      expect(response).to render_template('new')
    end
  end

  describe 'PUT #update' do

    it 'redirects to newly updated item' do
      user = FactoryGirl.create(:user)
      card = FactoryGirl.create(:card, user: user)
      login_user(user)
      put :update, params: {id: card.id, card: {original_text: 'as'}}
      expect(response).to redirect_to(card_path(assigns(:card)))
    end

    it 'renders update view in case if update failed' do
      user = FactoryGirl.create(:user)
      card = FactoryGirl.create(:card, user: user)
      login_user(user)
      put :update, params: {id: card.id, card: {original_text: nil}}
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE #delete' do

    it 'renders all cards url in case if card is destroyed' do
      user = FactoryGirl.create(:user)
      card = FactoryGirl.create(:card, user: user)
      login_user(user)
      delete :destroy, params: {id: card.id}
      expect(response).to redirect_to(cards_url)
    end
  end

end
