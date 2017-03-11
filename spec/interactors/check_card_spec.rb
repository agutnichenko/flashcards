require 'rails_helper'
RSpec.describe Card, :type => :iteractor do

  it 'call should check whether translated text matches original' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result).to be_a_success
  end
end