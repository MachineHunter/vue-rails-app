require 'test_helper'

module Api
  module Practice
    class PracticeControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_practice_practice_index_url
        assert_response :success
      end
    end
  end
end
