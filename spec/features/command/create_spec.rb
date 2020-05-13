require 'rails_helper'

RSpec.feature 'Create Command', type: :feature do
  given!(:user) { create(:user) }
  given!(:genre) { create(:genre) }
  given!(:command_type) { create(:command_type) }

  before do
    Capybara.current_driver = :selenium_chrome_headless
    sign_in_with_factory user
  end

  scenario 'normal create' do
    visit new_command_page_path
    fill_in 'title', with: 'feature_title_command'
    fill_in 'description', with: 'inputed from feature spec'
    find(:css, '#genre_id > div:nth-child(1) > label:nth-child(2)').click
    find(:css, '#command_type_id > div:nth-child(1) > label:nth-child(2)').click
    attach_file 'zipdata', "#{Rails.root}/spec/factories/testfiles/test.zip", make_visible: true
    click_button 'submit-command'
    wait_url(command_pages_index_path)
    expect(Command.last.title).to eq 'feature_title_command'
    expect(CommandFile.last.zipdata.nil?).to eq false
  end

  scenario 'no selection of command type' do
    visit new_command_page_path
    fill_in 'title', with: 'feature_title_command'
    fill_in 'description', with: 'inputed from feature spec'
    find(:css, '#genre_id > div:nth-child(1) > label:nth-child(2)').click
    attach_file 'zipdata', "#{Rails.root}/spec/factories/testfiles/test.zip", make_visible: true
    click_button 'submit-command'
    expect(page).to have_content 'コマンドのタイプを選択してください'
  end

  scenario 'no file' do
    visit new_command_page_path
    fill_in 'title', with: 'feature_title_command'
    fill_in 'description', with: 'inputed from feature spec'
    find(:css, '#genre_id > div:nth-child(1) > label:nth-child(2)').click
    find(:css, '#command_type_id > div:nth-child(1) > label:nth-child(2)').click
    click_button 'submit-command'
    expect(page).to have_content '投稿するファイルを選択してください'
  end
end
