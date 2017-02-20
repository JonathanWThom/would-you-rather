require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions).through(:responses) }
  it { should have_many :responses }
end
