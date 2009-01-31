require 'test_helper'

class KpisControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kpis)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kpi
    assert_difference('Kpi.count') do
      post :create, :kpi => { }
    end

    assert_redirected_to kpi_path(assigns(:kpi))
  end

  def test_should_show_kpi
    get :show, :id => kpis(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kpis(:one).id
    assert_response :success
  end

  def test_should_update_kpi
    put :update, :id => kpis(:one).id, :kpi => { }
    assert_redirected_to kpi_path(assigns(:kpi))
  end

  def test_should_destroy_kpi
    assert_difference('Kpi.count', -1) do
      delete :destroy, :id => kpis(:one).id
    end

    assert_redirected_to kpis_path
  end
end
