class IntervenientesController < ApplicationController
  # GET /intervenientes
  # GET /intervenientes.json
  def index
    @intervenientes = Interveniente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @intervenientes }
    end
  end

  # GET /intervenientes/1
  # GET /intervenientes/1.json
  def show
    @interveniente = Interveniente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interveniente }
    end
  end

  # GET /intervenientes/new
  # GET /intervenientes/new.json
  def new
    @interveniente = Interveniente.new
    @interveniente.endereco = Endereco.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interveniente }
    end
  end

  # GET /intervenientes/1/edit
  def edit
    @interveniente = Interveniente.find(params[:id])
  end

  # POST /intervenientes
  # POST /intervenientes.json
  def create
    @interveniente = Interveniente.new(params[:interveniente])
    #@interveniente.endereco = Endereco.new(params[:endereco])
    #v1 = @interveniente.valid?
    #v2 = @interveniente.endereco.valid?
    respond_to do |format|
      if @interveniente.save
        #@interveniente.save
        format.html { redirect_to @interveniente, notice: 'Interveniente was successfully created.' }
        format.json { render json: @interveniente, status: :created, location: @interveniente }
      else
        format.html { render action: "new" }
        format.json { render json: @interveniente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /intervenientes/1
  # PUT /intervenientes/1.json
  def update
    @interveniente = Interveniente.find(params[:id])
    #v1 = @interveniente.valid?
    #v2 = @interveniente.endereco.valid?
    respond_to do |format|
      if @interveniente.update_attributes(params[:interveniente])
        #@interveniente.update_attributes(params[:interveniente])
        #@interveniente.endereco.update_attributes(params[:endereco])

        format.html { redirect_to @interveniente, notice: 'Interveniente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interveniente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervenientes/1
  # DELETE /intervenientes/1.json
  def destroy
    @interveniente = Interveniente.find(params[:id])
    @interveniente.destroy

    respond_to do |format|
      format.html { redirect_to intervenientes_url }
      format.json { head :no_content }
    end
  end
end
