require 'test_helper'

class DataentryControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dataentry)
  end
end
