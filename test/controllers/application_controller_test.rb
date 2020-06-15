require 'test_helper'
class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_path
    assert_response :ok
    assert_includes response.body, "Welcome to David's Ropes page!"
  end
end
