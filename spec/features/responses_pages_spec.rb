require 'rails_helper'

describe 'responses path' do
  it 'will add a response', js: true do
    question = create(:question)
    user = create(:user)
    login_as(user)
    visit root_path
    check('response_option_1')
    click_on 'Vote'
    expect(page).to have_content('yah')
  end
end
