class DepartamentosController < ApplicationController
  # GET /departamentos
  # GET /departamentos.json
  def index
    @departamentos = Departamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departamentos }
    end
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
    @departamento = Departamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/new
  # GET /departamentos/new.json
  def new
    @departamento = Departamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/1/edit
  def edit
    @departamento = Departamento.find(params[:id])
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(params[:departamento])

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: 'Departamento was successfully created.' }
        format.json { render json: @departamento, status: :created, location: @departamento }
      else
        format.html { render action: "new" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departamentos/1
  # PUT /departamentos/1.json
  def update
    @departamento = Departamento.find(params[:id])

    respond_to do |format|
      if @departamento.update_attributes(params[:departamento])
        format.html { redirect_to @departamento, notice: 'Departamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento = Departamento.find(params[:id])
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to departamentos_url }
      format.json { head :no_content }
    end
  end
end
