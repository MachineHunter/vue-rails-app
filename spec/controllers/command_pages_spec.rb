require 'rails_helper'

RSpec.describe 'CommandPages', type: :request do
  let!(:command) { create(:command) }
  let(:download) { get download_command_pages_path command.id }

  describe 'download' do
    it do
      download
      expect(response).to have_http_status(200)
      expect(response.header['Content-Type']).to eq 'application/zip'
    end
  end
end
