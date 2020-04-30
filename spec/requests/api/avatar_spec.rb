require 'rails_helper'

RSpec.describe 'Avatar', type: :request do
  include ActionDispatch::TestProcess

  let!(:avatar) { create(:avatar) }
  let(:user) { avatar.user }
  let(:send_index_request) { get api_avatar_index_path }
  let(:send_update_request) { post api_avatar_update_path, params: params, headers: { 'Content-Type': 'multipart/form-data' } }
  let(:result) { JSON.parse(response.body, { symbolize_names: true }) }
  let(:params) do
    {
      "avatar": fixture_file_upload("#{Rails.root}/spec/factories/images/eagle.jpg", 'image/jpeg')
    }
  end

  before do
    login user
  end

  describe 'GET /api/avatar/index' do
    it 'check if response has correct image' do
      send_index_request
      expect(response).to have_http_status(200)
      expect(response.body).to eq avatar.image
    end
  end

  describe 'POST /api/avatar/update' do
    it 'with correct params' do
      send_update_request
      expect(response).to have_http_status(302)
      expect(user.avatar.filename).to eq params[:avatar].original_filename
    end
  end
end
