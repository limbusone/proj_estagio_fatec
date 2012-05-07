class PedidoAlteracaosController < ApplicationController
  # GET /pedido_alteracaos
  # GET /pedido_alteracaos.json
  def index
    @pedido_alteracaos = PedidoAlteracao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedido_alteracaos }
    end
  end

  # GET /pedido_alteracaos/1
  # GET /pedido_alteracaos/1.json
  def show
    @pedido_alteracao = PedidoAlteracao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido_alteracao }
    end
  end

  # GET /pedido_alteracaos/new
  # GET /pedido_alteracaos/new.json
  def new
    @pedido_alteracao = PedidoAlteracao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pedido_alteracao }
    end
  end

  # GET /pedido_alteracaos/1/edit
  def edit
    @pedido_alteracao = PedidoAlteracao.find(params[:id])
  end

  # POST /pedido_alteracaos
  # POST /pedido_alteracaos.json
  def create
    @pedido_alteracao = PedidoAlteracao.new(params[:pedido_alteracao])

    respond_to do |format|
      if @pedido_alteracao.save
        format.html { redirect_to @pedido_alteracao, notice: 'Pedido alteracao was successfully created.' }
        format.json { render json: @pedido_alteracao, status: :created, location: @pedido_alteracao }
      else
        format.html { render action: "new" }
        format.json { render json: @pedido_alteracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pedido_alteracaos/1
  # PUT /pedido_alteracaos/1.json
  def update
    @pedido_alteracao = PedidoAlteracao.find(params[:id])

    respond_to do |format|
      if @pedido_alteracao.update_attributes(params[:pedido_alteracao])
        format.html { redirect_to @pedido_alteracao, notice: 'Pedido alteracao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pedido_alteracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedido_alteracaos/1
  # DELETE /pedido_alteracaos/1.json
  def destroy
    @pedido_alteracao = PedidoAlteracao.find(params[:id])
    @pedido_alteracao.destroy

    respond_to do |format|
      format.html { redirect_to pedido_alteracaos_url }
      format.json { head :no_content }
    end
  end
end
