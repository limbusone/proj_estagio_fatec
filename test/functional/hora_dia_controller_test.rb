require 'test_helper'

class HoraDiaControllerTest < ActionController::TestCase
  setup do
    @hora_dium = hora_dia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hora_dia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hora_dium" do
    assert_difference('HoraDium.count') do
      post :create, hora_dium: { detalhe_termo_id: @hora_dium.detalhe_termo_id, final: @hora_dium.final, inicio: @hora_dium.inicio }
    end

    assert_redirected_to hora_dium_path(assigns(:hora_dium))
  end

  test "should show hora_dium" do
    get :show, id: @hora_dium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hora_dium
    assert_response :success
  end

  test "should update hora_dium" do
    put :update, id: @hora_dium, hora_dium: { detalhe_termo_id: @hora_dium.detalhe_termo_id, final: @hora_dium.final, inicio: @hora_dium.inicio }
    assert_redirected_to hora_dium_path(assigns(:hora_dium))
  end

  test "should destroy hora_dium" do
    assert_difference('HoraDium.count', -1) do
      delete :destroy, id: @hora_dium
    end

    assert_redirected_to hora_dia_path
  end
end
