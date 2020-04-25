require 'rails_helper'

RSpec.feature 'Sign In', type: :feature do
  given!(:user) { create(:user) }
  given(:wrong_email) { "wrong@gmail.com" }
  given(:wrong_password) { "wrongpass" }
  
  scenario "normal sign in" do
    sign_in_with_factory(user)
    expect(current_url).to eq host+root_path
  end

  scenario "informat email" do
    sign_in_without_factory(wrong_email, user.password)
    expect(page).to have_content "無効な形式です"
  end

  scenario "informat password" do
    sign_in_without_factory(user.email, wrong_password)
    expect(page).to have_content "無効な形式です"
  end

end
