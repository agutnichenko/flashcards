FactoryGirl.define do
  factory :card do
    original_text 'girl'
    translated_text 'factory'
    association :user
    counter_correct 0
    counter_incorrect 0
  end
end
