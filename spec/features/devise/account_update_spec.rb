require 'rails_helper'

RSpec.feature 'Account Update', type: :feature do
  given!(:user) { create(:user) }

  background do
    Capybara.current_driver = :selenium_chrome_headless
    sign_in_with_factory user
  end

  scenario 'normal update' do
    email_before = user.email
    account_update('afterupload', '', 'newpass', 'newpass', user.password)
    user.reload
    expect(user.name).to eq('afterupload')
    expect(user.email).to eq(email_before)
  end

  scenario 'informat email' do
    account_update('afterupload', '@gmail.com', 'newpass', 'newpass', user.password)
    expect(page).to have_content '無効な形式です'
  end

  scenario 'wrong password' do
    account_update('afterupload', '', 'newpass', 'newpass', 'spcspec')
    expect(page).to have_content 'Current password is invalid'
  end

  scenario 'unmatched password' do
    account_update('afterupload', '', 'newpass', 'nepass', user.password)
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end
end
