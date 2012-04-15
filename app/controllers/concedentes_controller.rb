class ConcedentesController < ApplicationController
  # GET /concedentes
  # GET /concedentes.json
  def index
    @concedentes = Concedente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @concedentes }
    end
  end

  # GET /concedentes/1
  # GET /concedentes/1.json
  def show
    @concedente = Concedente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concedente }
    end
  end

  # GET /concedentes/new
  # GET /concedentes/new.json
  def new
    @concedente = Concedente.new
    @concedente.endereco = Endereco.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concedente }
    end
  end

  # GET /concedentes/1/edit
  def edit
    @concedente = Concedente.find(params[:id])
  end

  # POST /concedentes
  # POST /concedentes.json
  def create
    @concedente = Concedente.new(params[:concedente])
    @concedente.endereco = Endereco.new(params[:endereco])
    v1 = @concedente.valid?
    v2 = @concedente.endereco.valid?
    respond_to do |format|
      if v1 && v2
        @concedente.save
        format.html { redirect_to @concedente, notice: 'Concedente was successfully created.' }
        format.json { render json: @concedente, status: :created, location: @concedente }
      else
        format.html { render action: "new" }
        format.json { render json: @concedente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /concedentes/1
  # PUT /concedentes/1.json
  def update
    @concedente = Concedente.find(params[:id])
    v1 = @concedente.valid?
    v2 = @concedente.endereco.valid?
    respond_to do |format|
      if v1 && v2
        @concedente.update_attributes(params[:concedente])
        @concedente.endereco.update_attributes(params[:endereco])
        format.html { redirect_to @concedente, notice: 'Concedente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concedente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concedentes/1
  # DELETE /concedentes/1.json
  def destroy
    @concedente = Concedente.find(params[:id])
    @concedente.destroy

    respond_to do |format|
      format.html { redirect_to concedentes_url }
      format.json { head :no_content }
    end
  end
end
