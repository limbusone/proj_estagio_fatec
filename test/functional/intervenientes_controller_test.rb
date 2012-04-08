require 'test_helper'

class IntervenientesControllerTest < ActionController::TestCase
  setup do
    @interveniente = intervenientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intervenientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interveniente" do
    assert_difference('Interveniente.count') do
      post :create, interveniente: { bairro: @interveniente.bairro, cep: @interveniente.cep, cidade: @interveniente.cidade, cnpj: @interveniente.cnpj, email: @interveniente.email, estado: @interveniente.estado, logradouro: @interveniente.logradouro, nome: @interveniente.nome, numero: @interveniente.numero, telefone: @interveniente.telefone }
    end

    assert_redirected_to interveniente_path(assigns(:interveniente))
  end

  test "should show interveniente" do
    get :show, id: @interveniente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interveniente
    assert_response :success
  end

  test "should update interveniente" do
    put :update, id: @interveniente, interveniente: { bairro: @interveniente.bairro, cep: @interveniente.cep, cidade: @interveniente.cidade, cnpj: @interveniente.cnpj, email: @interveniente.email, estado: @interveniente.estado, logradouro: @interveniente.logradouro, nome: @interveniente.nome, numero: @interveniente.numero, telefone: @interveniente.telefone }
    assert_redirected_to interveniente_path(assigns(:interveniente))
  end

  test "should destroy interveniente" do
    assert_difference('Interveniente.count', -1) do
      delete :destroy, id: @interveniente
    end

    assert_redirected_to intervenientes_path
  end
end
