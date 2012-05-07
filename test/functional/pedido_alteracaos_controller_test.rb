require 'test_helper'

class PedidoAlteracaosControllerTest < ActionController::TestCase
  setup do
    @pedido_alteracao = pedido_alteracaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedido_alteracaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido_alteracao" do
    assert_difference('PedidoAlteracao.count') do
      post :create, pedido_alteracao: { alteravel_id: @pedido_alteracao.alteravel_id, alteravel_type: @pedido_alteracao.alteravel_type, atendido: @pedido_alteracao.atendido, comentario: @pedido_alteracao.comentario, detalhe_termo_id: @pedido_alteracao.detalhe_termo_id, professor_id: @pedido_alteracao.professor_id }
    end

    assert_redirected_to pedido_alteracao_path(assigns(:pedido_alteracao))
  end

  test "should show pedido_alteracao" do
    get :show, id: @pedido_alteracao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedido_alteracao
    assert_response :success
  end

  test "should update pedido_alteracao" do
    put :update, id: @pedido_alteracao, pedido_alteracao: { alteravel_id: @pedido_alteracao.alteravel_id, alteravel_type: @pedido_alteracao.alteravel_type, atendido: @pedido_alteracao.atendido, comentario: @pedido_alteracao.comentario, detalhe_termo_id: @pedido_alteracao.detalhe_termo_id, professor_id: @pedido_alteracao.professor_id }
    assert_redirected_to pedido_alteracao_path(assigns(:pedido_alteracao))
  end

  test "should destroy pedido_alteracao" do
    assert_difference('PedidoAlteracao.count', -1) do
      delete :destroy, id: @pedido_alteracao
    end

    assert_redirected_to pedido_alteracaos_path
  end
end
