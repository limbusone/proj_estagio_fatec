require 'test_helper'

class TcesControllerTest < ActionController::TestCase
  setup do
    @tce = tces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tce" do
    assert_difference('Tce.count') do
      post :create, tce: { aluno_id: @tce.aluno_id, convenio_id: @tce.convenio_id, detalhe_termo_id: @tce.detalhe_termo_id, rescidido: @tce.rescidido, validado: @tce.validado }
    end

    assert_redirected_to tce_path(assigns(:tce))
  end

  test "should show tce" do
    get :show, id: @tce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tce
    assert_response :success
  end

  test "should update tce" do
    put :update, id: @tce, tce: { aluno_id: @tce.aluno_id, convenio_id: @tce.convenio_id, detalhe_termo_id: @tce.detalhe_termo_id, rescidido: @tce.rescidido, validado: @tce.validado }
    assert_redirected_to tce_path(assigns(:tce))
  end

  test "should destroy tce" do
    assert_difference('Tce.count', -1) do
      delete :destroy, id: @tce
    end

    assert_redirected_to tces_path
  end
end
