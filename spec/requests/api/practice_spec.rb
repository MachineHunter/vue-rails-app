require "rails_helper"

RSpec.describe "Api::Practice::PracticeController", type: :request do
  let!(:practice) { create(:practice) }
  let(:send_index_request) { get api_practice_path 1 }
  let(:send_create_request) { post api_practice_practice_create_path, params: params }
  let(:result) { JSON.parse(response.body, {:symbolize_names => true}) }
  let(:params) do
    {
      title: "test data",
      description: "this is from spec",
      contents: "post parameter this is"
    }
  end

  describe "GET /api/practice/practice/index/:id" do
    it "check if response has correct json" do
      send_index_request
      expect(response).to have_http_status(200)
      expect(result[:contents][0][:name]).to eq("jack")
    end
  end

  describe "POST /api/practice/practice/create" do
    it "check if data is created" do
      send_create_request
      expect(response).to have_http_status(201)
      expect(result[:title]).to eq("test data")
    end
  end
end
