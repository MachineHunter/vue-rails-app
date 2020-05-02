require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  before do
    Capybara.current_driver = :selenium_chrome_headless
  end

  scenario 'normal sign up' do
    sign_up('tester', 'test@gmail.com', 'testtest', 'testtest')
    expect(current_path).to eq root_path
  end

  scenario 'informat email' do
    visit new_user_registration_path
    sign_up('tester', '@gmail.com', 'testtest', 'testtest')
    expect(page).to have_content '無効な形式です'
  end
end
