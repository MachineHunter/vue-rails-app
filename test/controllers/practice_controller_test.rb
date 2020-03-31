require 'test_helper'

class PracticeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get practice_index_url
    assert_response :success
  end

end
