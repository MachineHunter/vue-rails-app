require 'rails_helper'

RSpec.feature 'Account Update', type: :feature do
  given!(:user) { create(:user) }

  before do
    Capybara.current_driver = :selenium_chrome_headless
  end

  scenario 'normal update' do
    binding.pry
    account_update('test', '', 'newpass', 'newpass', 'specspec')
    binding.pry
    #expect(current_path).to eq root_path
  end

  #scenario 'informat email' do
    #visit new_user_registration_path
    #sign_up('tester', '@gmail.com', 'testtest', 'testtest')
    #expect(page).to have_content '無効な形式です'
  #end
end
