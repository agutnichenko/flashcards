require 'rails_helper'

RSpec.describe CheckCard, type: :interactor do
  describe '#call' do
    context 'correct answer' do
      context '0 correct, < 3 incorrect' do
        it 'review_date + 12 hours' do
          card = create_and_call_card_with(0, 0)
          expect(card.review_date.to_date).to eq(12.hours.since.to_date)
        end
      end

      context '1 correct, < 3 incorrect' do
        it 'review_date + 3 days' do
          card = create_and_call_card_with(1, 0)
          expect(card.review_date.to_date).to eq(3.days.since.to_date)
        end
      end

      context '2 correct, < 3 incorrect' do
        it 'review_date + 7 days' do
          card = create_and_call_card_with(2, 0)
          expect(card.review_date.to_date).to eq(7.days.since.to_date)
        end
      end

      context '3 correct, < 3 incorrect' do
        it 'review_date + 2 weeks' do
          card = create_and_call_card_with(3, 0)
          expect(card.review_date.to_date).to eq(2.weeks.since.to_date)
        end
      end

      context '4 or more correct, < 3 incorrect' do
        it 'review_date + 1 month' do
          card = create_and_call_card_with(4, 0)
          expect(card.review_date.to_date).to eq(1.month.since.to_date)
        end
      end
    end

    context 'incorrect_answer' do
      context 'any correct, 1 incorrect' do
        it 'same review_date' do
          card = create_and_call_card_with(0, 1, false)
          expect(card.review_date.to_date).to eq(Time.now.to_date)
        end
      end

      context 'any correct, 2 incorrect' do
        it 'same review_date' do
          card = create_and_call_card_with(0, 2, false)
          expect(card.review_date.to_date).to eq(Time.now.to_date)
        end
      end

      context 'any correct, 3 incorrect' do
        it 'drops counters' do
          card = create_and_call_card_with(0, 3, false)
          expect(card.counter_correct).to eq(0)
          expect(card.counter_incorrect).to eq(0)
        end
      end
    end
  end

  def create_and_call_card_with(correct, incorrect, answer = true)
    card = create(:card, counter_correct: correct, counter_incorrect: incorrect)
    original = answer ? card.original_text : 'something'
    params = { original_text: original, id: card.id }
    CheckCard.call(user: card.user, params: params)
    card.reload
  end
end
