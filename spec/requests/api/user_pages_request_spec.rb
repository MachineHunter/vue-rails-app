require 'rails_helper'

RSpec.describe 'UserPages', type: :request do
  let!(:user) { create(:user) }
  let(:send_index_request) { get api_user_pages_index_path }
  let(:result) { JSON.parse(response.body, { symbolize_names: true }) }

  before do
    login user
  end

  describe 'GET /api/user_pages/index' do
    it 'check if response has correct json' do
      send_index_request
      expect(response).to have_http_status(200)
      expect(result[:user][:name]).to eq('specuser')
    end
  end

end
