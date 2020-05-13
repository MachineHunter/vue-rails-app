require 'rails_helper'

RSpec.describe 'UserPages', type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let(:send_index_request_own) { get api_user_pages_index_path 0 }
  let(:send_index_request_other) { get api_user_pages_index_path user2.id }
  let(:result) { JSON.parse(response.body, { symbolize_names: true }) }

  before do
    login user
  end

  describe 'index' do
    it 'own profile' do
      send_index_request_own
      expect(response).to have_http_status(200)
      expect(result[:user][:name]).to eq(user.name)
    end

    it 'other profile' do
      send_index_request_other
      expect(response).to have_http_status(200)
      expect(result[:user][:name]).to eq(user2.name)
    end
  end
end
