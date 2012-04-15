require 'test_helper'

class ConcedentesControllerTest < ActionController::TestCase
  setup do
    @concedente = concedentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concedentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concedente" do
    assert_difference('Concedente.count') do
      post :create, concedente: {  }
    end

    assert_redirected_to concedente_path(assigns(:concedente))
  end

  test "should show concedente" do
    get :show, id: @concedente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concedente
    assert_response :success
  end

  test "should update concedente" do
    put :update, id: @concedente, concedente: {  }
    assert_redirected_to concedente_path(assigns(:concedente))
  end

  test "should destroy concedente" do
    assert_difference('Concedente.count', -1) do
      delete :destroy, id: @concedente
    end

    assert_redirected_to concedentes_path
  end
end
