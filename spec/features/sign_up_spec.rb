require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario "normal sign up" do
    expect{ sign_up("tester", "test@gmail.com", "testtest", "testtest", "#{Rails.root}/spec/factories/images/eagle.jpg") }.to change {
    }.to(root_path)
  end

end
