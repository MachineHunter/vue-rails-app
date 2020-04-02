require "rails_helper"

RSpec.describe "Api::Practice::PracticeController", type: :request do
  let!(:practice) { create(:practice) }
  let(:send_request) { get api_practice_practice_index_path }
  let(:result) { JSON.parse(response.body, {:symbolize_names => true}) }

  describe "GET /api/practice/practice/index" do
    it "check if response has correct json" do
      send_request
      expect(response).to have_http_status(200)
      expect(result[:contents][0][:name]).to eq("jack")
    end
  end
end
