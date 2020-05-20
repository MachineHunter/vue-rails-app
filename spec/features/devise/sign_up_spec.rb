require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  background do
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


  feature 'name validation' do
    scenario 'length over' do
      sign_up('aaaaaaaaaa aaaaaaaaaaaaaaaaaaaa', 'test@gmail.com', 'testtest', 'testtest')
      expect(page).to have_content 'Bad Request'
    end

    scenario 'number underscore dot' do
      sign_up('0099_ab', 'test@gmail.com', 'testtest', 'testtest')
      expect(current_path).to eq root_path
    end

    scenario 'dash dot' do
      sign_up('aaa-aaa.', 'test@gmail.com', 'testtest', 'testtest')
      expect(page).to have_content 'Bad Request'
    end

    scenario 'japanese' do
      sign_up('スズキ太郎でーす', 'test@gmail.com', 'testtest', 'testtest')
      expect(current_path).to eq root_path
    end

    scenario 'japanese allowed kigou' do
      sign_up('＿あああabc', 'test@gmail.com', 'testtest', 'testtest')
      expect(current_path).to eq root_path
    end

    scenario 'japanese disabled kigou' do
      sign_up('-。です', 'test@gmail.com', 'testtest', 'testtest')
      expect(page).to have_content 'Bad Request'
    end
  end


  feature 'email validation' do
    scenario 'same email' do
      create(:user, email: 'same@gmail.com')
      sign_up('bbbbbb', 'same@gmail.com', 'testt', 'testt')
      expect(page).to have_content 'Email has already been taken'
    end
  end
end
