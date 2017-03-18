FactoryGirl.define do
  factory :card do
    original_text 'girl'
    translated_text 'factory'
    association :user
    counter_correct :counter_correct
    counter_incorrect :counter_incorrect
  end
end
