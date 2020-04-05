require 'test_helper'

class Api::Practice::PracticeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_practice_practice_index_url
    assert_response :success
  end
end
