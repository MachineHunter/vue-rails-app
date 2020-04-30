require 'rails_helper'

RSpec.describe 'Avatar', type: :request do
  include ActionDispatch::TestProcess

  let!(:avatar) { create(:avatar) }
  let(:user) { avatar.user }

  before do
    login user
  end

  describe 'GET /api/avatar/index' do
    it 'check if response has correct image' do
      get api_avatar_index_path
      expect(response).to have_http_status(200)
      expect(response.body).to eq avatar.image
    end
  end

  describe 'POST /api/avatar/update' do
    it 'complete data' do
      params = {
        "avatar": fixture_file_upload("#{Rails.root}/spec/factories/images/white.jpeg", 'image/jpeg')
      }
      post api_avatar_update_path, params: params, headers: { 'Content-Type': 'multipart/form-data' }
      expect(response).to have_http_status(302)
      expect(user.avatar.filename).to eq 'white.jpeg'
      expect(user.avatar.image).not_to eq nil
    end

    it 'wrong prefix' do
      params = {
        "avatar": fixture_file_upload("#{Rails.root}/spec/factories/images/flower.jpg", 'image/jpeg')
      }
      post api_avatar_update_path, params: params, headers: { 'Content-Type': 'multipart/form-data' }
      expect(response).to have_http_status(302)
      expect(user.avatar.filename).to eq 'flower.jpeg'
      expect(user.avatar.image).not_to eq nil
    end

    it 'broken data' do
      params = {
        "avatar": fixture_file_upload("#{Rails.root}/spec/factories/images/not-image.jpg", 'image/jpg')
      }
      post api_avatar_update_path, params: params, headers: { 'Content-Type': 'multipart/form-data' }
      expect(response).to have_http_status(400)
      expect(JSON.parse(response.body, { symbolize_names: true })[:message]).to eq("Bad Request")
    end
  end
end
