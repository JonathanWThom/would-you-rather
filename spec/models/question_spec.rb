require 'rails_helper'

describe Question do
  it { should validate_presence_of :content }
  it { should validate_presence_of :option_1 }
  it { should validate_presence_of :option_2 }
  it { should have_many :responses }
end
