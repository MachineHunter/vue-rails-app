require 'rails_helper'

RSpec.feature 'Account Update', type: :feature do
  given!(:user) { create(:user) }

  before do
    Capybara.current_driver = :selenium_chrome_headless
    sign_in_with_factory user
  end

  scenario 'normal update' do
    account_update('太郎', 'test@gmail.com', 'newpass', 'newpass', 'specspec')
    binding.pry
    #expect(current_path).to eq root_path
  end

  #scenario 'informat email' do
    #visit new_user_registration_path
    #sign_up('tester', '@gmail.com', 'testtest', 'testtest')
    #expect(page).to have_content '無効な形式です'
  #end
end
