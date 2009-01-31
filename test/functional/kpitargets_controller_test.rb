require 'test_helper'

class KpitargetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kpitargets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kpitarget
    assert_difference('Kpitarget.count') do
      post :create, :kpitarget => { }
    end

    assert_redirected_to kpitarget_path(assigns(:kpitarget))
  end

  def test_should_show_kpitarget
    get :show, :id => kpitargets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kpitargets(:one).id
    assert_response :success
  end

  def test_should_update_kpitarget
    put :update, :id => kpitargets(:one).id, :kpitarget => { }
    assert_redirected_to kpitarget_path(assigns(:kpitarget))
  end

  def test_should_destroy_kpitarget
    assert_difference('Kpitarget.count', -1) do
      delete :destroy, :id => kpitargets(:one).id
    end

    assert_redirected_to kpitargets_path
  end
end
