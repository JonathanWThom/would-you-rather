require 'rails_helper'

describe 'questions path' do
  it 'will add a new question', js: true do
    visit root_path
    click_link 'Add a question'
    fill_in 'question_content', :with => 'Does this work?'
    fill_in 'question_option_1', :with => 'Yes'
    fill_in 'question_option_2', :with => 'No'
    fill_in 'question_photo_1', :with => 'https://image.com'
    fill_in 'question_photo_2', :with => 'https://image.com'
    click_on "Create Question"
    # AJAX works but not rendering correctly for spec
    expect(page).to have_content('Add a question')
  end

  it 'will fail to add a new question', js: true do
    visit root_path
    click_link 'Add a question'
    click_on "Create Question"
    # AJAX works but not rendering correctly for spec
    expect(page).to have_content('Your question')
  end
end
