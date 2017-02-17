require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :cards }
  it { should validate_uniqueness_of :email }
  it { should validate_length_of(:password).is_at_least(3) }

  it 'email presence' do
    user = User.new(email: '', password: 'qwerty123', password_confirmation: 'qwerty123')
    expect(user.errors[:email]).not_to be_nil
  end

  it 'password_confirmation presence' do
    user = User.create(email: 'blablabla', password: '123456', password_confirmation: '')
    expect(user).to_not be_valid
  end

  it 'password presence' do
    user = User.create(email: 'blablabla', password: '', password_confirmation: '123456')
    expect(user).to_not be_valid
  end

end
