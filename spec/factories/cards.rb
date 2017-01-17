FactoryGirl.define do
  factory :card do
    original_text 'girl'
    translated_text 'factory'
    association :user
  end
end