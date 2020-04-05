require "rails_helper"

RSpec.describe "Api::Practice::PracticeController", type: :request do
  let!(:practice) { create(:practice) }
  let(:send_index_request) { get api_practice_path 1 }
  let(:send_create_request) { post api_practice_practice_create_path, params: create_params }
  let(:send_update_request) { put api_practice_practice_update_path, params: update_params }
  let(:send_delete_request) { delete api_practice_practice_destroy_path, params: destroy_params }
  let(:result) { JSON.parse(response.body, {:symbolize_names => true}) }
  let(:create_params) do
    {
      title: "test data",
      description: "this is from spec",
      contents: "post parameter this is"
    }
  end
  let(:update_params) do
    {
      title: "test updated data",
      description: "this is from spec",
      contents: "put parameter this is"
    }
  end
  let(:destroy_params) do
    {
      id_list: []
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

  describe "PUT /api/practice/practice/update" do
    before do
      send_create_request
      expect(response).to have_http_status(201)
      created_data_id = result[:id]
      update_params[:id] = created_data_id
    end

    it "check if data is updated" do
      expect do
        send_update_request
      end.to change { Practice.find(update_params[:id]).title }.from("test data").to("test updated data")
      expect(response).to have_http_status(202)
    end
  end

  describe "DELETE /api/practice/practice/destroy" do
    before do
      Practice.destroy_all
      practice1 = create(:practice, id:1, title:"pra1", description:"desc1", contents:"con1")
      practice2 = create(:practice, id:2, title:"pra2", description:"desc2", contents:"con2")
      practice3 = create(:practice, id:3, title:"pra3", description:"desc3", contents:"con3")
      destroy_params[:id_list].push practice1.id
      destroy_params[:id_list].push practice2.id
    end

    it "check if data is destroyed" do
      expect do
        send_delete_request
      end.to change { Practice.count }.from(3).to(1)
      expect(response).to have_http_status(202)
    end
  end
end
