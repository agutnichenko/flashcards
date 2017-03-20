FactoryGirl.define do
  factory :card do
    original_text 'girl'
    translated_text 'factory'
    association :user
    counter_incorrect 0
    counter_correct 0
  end
end
