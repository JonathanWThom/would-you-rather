require 'rails_helper'

describe 'responses path' do
  it 'will add a response', js: true do
    question = create(:question)
    user = create(:user)
    login_as(user)
    visit root_path
    check('response_option_1')
    click_on 'Vote'
    expect(page).to have_content('You voted for nah')
  end

  it 'will leave a comment', js: true do
    question = create(:question)
    user = create(:user)
    login_as(user)
    visit root_path
    check('response_option_1')
    click_on 'Vote'
    click_on 'Edit'
    fill_in 'response_comment', :with => 'This is a comment'
    click_on 'Update Response'
    expect(page).to have_content 'This is a comment'
  end
end
