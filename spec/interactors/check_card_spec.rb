require 'rails_helper'
RSpec.describe Card, :type => :iteractor do

  it 'check review_date after first successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 0, counter_incorrect: 0)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(12.hours.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after second successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 1, counter_incorrect: 0)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(3.days.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after third successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 2, counter_incorrect: 0)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(7.days.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after fourth successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 3, counter_incorrect: 0)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(14.days.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after fifth successful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 4, counter_incorrect: 0)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(1.month.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after first unsuccessful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 0, counter_incorrect: 1)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(12.hours.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after first unsuccessful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 0, counter_incorrect: 2)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(result.review_date.strftime('%a, %e %b %Y')).to eq(12.hours.from_now.strftime('%a, %e %b %Y'))
  end

  it 'check review_date after third unsuccessful attempt ' do
    @current_user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user: @current_user, counter_correct: 0, counter_incorrect: 3)
    @params = {original_text: @card.original_text, id: @card.id, counter_correct: @card.counter_correct, counter_incorrect: @card.counter_incorrect}
    result = CheckCard.call(user: @current_user, params: @params)
    expect(@card.review_date.strftime('%a, %e %b %Y')).to eq(Time.now.strftime('%a, %e %b %Y'))
  end

end
