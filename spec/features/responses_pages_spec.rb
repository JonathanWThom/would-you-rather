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

  it 'will add a response to 2', js: true do
    question = create(:question)
    user = create(:user)
    login_as(user)
    visit root_path
    check('response_option_2')
    click_on 'Vote'
    expect(page).to have_content('You voted for yah')
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

  it 'will test for blank comment', js: true do
    question = create(:question)
    user = create(:user)
    login_as(user)
    visit root_path
    check('response_option_1')
    click_on 'Vote'
    click_on 'Edit'
    click_on 'Update Response'
    expect(page).to have_content('nope')
  end
end
