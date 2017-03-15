require 'rails_helper'

RSpec.describe Card, :type => :model do
  it 'check uniqueness' do
    card = Card.new(original_text: 'ds', translated_text: 'ds')
    expect(card.check_uniqueness).to include 'translated text should not be equal to original one'
  end

  it 'check_date method' do
    card = FactoryGirl.create(:card)
    expect(card.review_date.strftime('%a, %e %b %Y')).to eq(Time.now.strftime('%a, %e %b %Y'))
  end

  it 'check random method' do
    card = FactoryGirl.create(:card)
    expect(card.id).not_to be_nil
  end

  it 'should not create duplicate card' do
    expect(FactoryGirl.create(:card, original_text: 'hello')).to be_persisted
    card = FactoryGirl.build(:card, original_text: 'hello')
    card.valid?
    expect(card.errors[:original_text]).to include 'has already been taken'
  end

  it 'original_text presence' do
    card = Card.new(original_text: '', translated_text: 'asdfg')
    expect(card.errors[:original_text]).not_to be_nil
  end

  it 'translated_text presence' do
    card = Card.new(original_text: 'blablabvcnc', translated_text: '')
    expect(card.errors[:translated_text]).not_to be_nil
  end

  it 'translated_text presence' do
    card = Card.new(original_text: 'blablabvcnc', translated_text: '')
    expect(card.errors[:translated_text]).not_to be_nil
  end

  it { should belong_to :user }
end
