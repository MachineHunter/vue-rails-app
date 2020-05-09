require 'rails_helper'

RSpec.describe 'Command', type: :request do
  let!(:command) { create(:command) }
  let(:user) { command.user }
  let(:send_index_request) { get api_command_index_path }
  let(:send_new_request) { get new_api_command_path }
  let(:send_show_request) { get api_command_path command.id }
  let(:send_destroy_request) { delete api_command_path command.id }
  let(:result) { JSON.parse(response.body, { symbolize_names: true }) }

  before do
    login user
  end

  describe 'index' do
    it do
      send_index_request
      expect(response).to have_http_status(200)
      expect(result[:command][0][:title]).to eq 'test_command'
    end
  end

  describe 'new' do
    it do
      send_new_request
      expect(response).to have_http_status(200)
      expect(result[:genres][0][:name]).to eq Genre.first.name
      expect(result[:command_types][0][:name]).to eq CommandType.first.name
    end
  end

  describe 'show' do
    it do
      send_show_request
      expect(response).to have_http_status(200)
      expect(result[:filename]).to eq command.command_file.filename
      expect(result[:filetree][:name]).to eq 'test'
      expect(result[:command][:title]).to eq 'test_command'
      expect(result[:filedatas].nil?).to eq false
    end
  end

  describe 'destroy' do
    it do
      expect do
        send_destroy_request
      end.to change { CommandFile.count }.by(-1)
    end
  end
end
