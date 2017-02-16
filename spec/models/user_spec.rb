require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :cards }
  it { should validate_uniqueness_of :email }
  it { should validate_length_of(:password).is_at_least(3) }

end
