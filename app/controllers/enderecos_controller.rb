class EnderecosController < ApplicationController
  # GET /enderecos
  # GET /enderecos.json
  def index
    @enderecos = Endereco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enderecos }
    end
  end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @endereco }
    end
  end

  # GET /enderecos/new
  # GET /enderecos/new.json
  def new
    @endereco = Endereco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @endereco }
    end
  end

  # GET /enderecos/1/edit
  def edit
    @endereco = Endereco.find(params[:id])
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = Endereco.new(params[:endereco])

    respond_to do |format|
      if @endereco.save
        format.html { redirect_to @endereco, notice: 'Endereco was successfully created.' }
        format.json { render json: @endereco, status: :created, location: @endereco }
      else
        format.html { render action: "new" }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enderecos/1
  # PUT /enderecos/1.json
  def update
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      if @endereco.update_attributes(params[:endereco])
        format.html { redirect_to @endereco, notice: 'Endereco was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco = Endereco.find(params[:id])
    @endereco.destroy

    respond_to do |format|
      format.html { redirect_to enderecos_url }
      format.json { head :no_content }
    end
  end
end
