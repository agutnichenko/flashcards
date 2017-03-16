require 'rails_helper'
RSpec.describe Card, :type => :iteractor do

  it 'call should check whether translated text matches original' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result).to be_a_success
  end

  it 'check review_date after first successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(@card.review_date).to be(12.hours.from_now)
  end

  #
  # it 'check_date method' do
  #   card = FactoryGirl.create(:card)
  #   expect(card.review_date.strftime('%a, %e %b %Y')).to eq(Time.now.strftime('%a, %e %b %Y'))
  # end

  it 'check review_date after second successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = 2.times do
      CheckCard.call(user: @current_user, params: @params)
    end
    expect(@card.review_date).to be(3.days.from_now)
  end

  it 'check review_date after third successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = 3.times do
      CheckCard.call(user: @current_user, params: @params)
    end
    expect(@card.review_date).to be(7.days.from_now)
  end

  it 'check review_date after fourth successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = 4.times do
      CheckCard.call(user: @current_user, params: @params)
    end
    expect(@card.review_date).to be(14.days.from_now)
  end

  it 'check review_date after fifth successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: @card.original_text, id: @card.id}
    result = 5.times do
      CheckCard.call(user: @current_user, params: @params)
    end
    expect(@card.review_date).to be(1.month.from_now)
  end

  it 'check review_date after third unsuccessful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user)
    @params = {original_text: 'incorrect_text', id: @card.id}
    result = 3.times do
      CheckCard.call(user: @current_user, params: @params)
    end
    expect(@card.review_date).to be(Time.now)
  end

end