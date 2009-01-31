require 'test_helper'

class TargetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:targets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_target
    assert_difference('Target.count') do
      post :create, :target => { }
    end

    assert_redirected_to target_path(assigns(:target))
  end

  def test_should_show_target
    get :show, :id => targets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => targets(:one).id
    assert_response :success
  end

  def test_should_update_target
    put :update, :id => targets(:one).id, :target => { }
    assert_redirected_to target_path(assigns(:target))
  end

  def test_should_destroy_target
    assert_difference('Target.count', -1) do
      delete :destroy, :id => targets(:one).id
    end

    assert_redirected_to targets_path
  end
end
