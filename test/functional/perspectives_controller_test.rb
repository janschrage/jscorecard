require 'test_helper'

class PerspectivesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:perspectives)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_perspective
    assert_difference('Perspective.count') do
      post :create, :perspective => { }
    end

    assert_redirected_to perspective_path(assigns(:perspective))
  end

  def test_should_show_perspective
    get :show, :id => perspectives(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => perspectives(:one).id
    assert_response :success
  end

  def test_should_update_perspective
    put :update, :id => perspectives(:one).id, :perspective => { }
    assert_redirected_to perspective_path(assigns(:perspective))
  end

  def test_should_destroy_perspective
    assert_difference('Perspective.count', -1) do
      delete :destroy, :id => perspectives(:one).id
    end

    assert_redirected_to perspectives_path
  end
end
