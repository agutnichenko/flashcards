require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET #destroy' do
  #   it 'returns http success' do
  #     user = FactoryGirl.create(:user)
  #     login_user(user)
  #     delete :destroy
  #     expect(response).to redirect_to('.login?locale=en')
  #   end
  # end

end
