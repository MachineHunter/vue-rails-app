require 'rails_helper'

RSpec.describe 'Command', type: :request do
  let!(:command) { create(:command) }
  let(:user) { command.user }
  let(:send_index_request) { get api_command_index_path }
  let(:result) { JSON.parse(response.body, { symbolize_names: true }) }

  before do
    login user
  end

  describe 'GET /api/command/index' do
    it 'check if response has correct image' do
      send_index_request
      expect(response).to have_http_status(200)
      expect(result[:command][0][:title]).to eq "test_command"
    end
  end

end
