FactoryGirl.define do
  factory :user do
    email 'MyStringnhtdyhfjg'
    password '123456'
    password_confirmation '123456'
    crypted_password 'MyString'
    salt 'MyString'
  end
end
