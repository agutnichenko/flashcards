require 'rails_helper'

RSpec.describe User, type: :model do
  it 'email presence' do
    user = User.new(email: '', password: 'qwerty123', password_confirmation: 'qwerty123')
    expect(user.errors[:email]).not_to be_nil
  end
end
