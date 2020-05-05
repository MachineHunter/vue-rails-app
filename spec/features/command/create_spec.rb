# require 'rails_helper'

# RSpec.feature 'Create Command', type: :feature do
# given!(:user) { create(:user) }

# before do
# Capybara.current_driver = :selenium_chrome_headless
# sign_in_with_factory user
# end

# scenario 'normal create' do
# visit new_command_page_path
# fill_in 'title', with: "feature_title_command"
# fill_in 'description', with: "inputed from feature spec"
# fill_in 'genre_id', with: "1"
# fill_in 'command_type_id', with: "1"
# fill_in 'filename', with: "feature_filename_command_file"
# attach_file 'zipdata', "#{Rails.root}/spec/factories/testfiles/test.zip"
# click_button '送信'
# expect(current_path).to eq command_pages_index_path
# end

# scenario 'informat email' do
# end

# scenario 'informat password' do
# end
# end
