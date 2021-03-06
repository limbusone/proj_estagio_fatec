#encoding: utf-8
class ConveniosController < ApplicationController
  # GET /convenios
  # GET /convenios.json
  def index
    @convenios = Convenio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @convenios }
    end
  end

  # GET /convenios/1
  # GET /convenios/1.json
  def show
    @convenio = Convenio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @convenio }
    end
  end

  # GET /convenios/new
  # GET /convenios/new.json
  def new
    @convenio =     Convenio.new
	  @empresas =     Concedente.find_by_sql("SELECT empresas.id, empresas.nome FROM empresas WHERE empresas.id not 					    in (SELECT convenios.concedente_id FROM convenios) AND empresas.type = 'Concedente'")
	  @intervenientes = Interveniente.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @convenio }
#      format.json { render json: @empresas }
#      format.json { render json: @intervenientes }
    end
  end

  # GET /convenios/1/edit
  def edit
    @convenio 		= 	Convenio.find(params[:id])
	  @empresas 		= 	Concedente.find_by_sql("SELECT empresas.id, empresas.nome FROM empresas WHERE 
                        empresas.id not	in (SELECT convenios.concedente_id FROM convenios WHERE convenios.concedente_id 
                        != #{@convenio.concedente_id}) AND empresas.type = 'Concedente'")
  	@intervenientes = 	Interveniente.all
  end

  # POST /convenios
  # POST /convenios.json
  def create
    @convenio = Convenio.new(params[:convenio])
	  @empresas = Concedente.find_by_sql("SELECT empresas.id, empresas.nome FROM empresas WHERE empresas.id 
                not in (SELECT convenios.concedente_id FROM convenios) AND empresas.type = 'Concedente'")
  	@intervenientes = Interveniente.all
    respond_to do |format|
      if @convenio.save
        format.html { redirect_to @convenio, notice: 'O Convênio foi celebrado com sucesso!' }
        format.json { render json: @convenio, status: :created, location: @convenio }
      else
        format.html { render action: "new" }
        format.json { render json: @convenio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /convenios/1
  # PUT /convenios/1.json
  def update
    @convenio = Convenio.find(params[:id])
	  @empresas = Concedente.find_by_sql("SELECT empresas.id, empresas.nome FROM empresas WHERE	empresas.id not	in (SELECT convenios.concedente_id FROM convenios WHERE convenios.concedente_id != #{@convenio.concedente_id}) AND empresas.type = 'Concedente'")
	  @intervenientes = 	Interveniente.all
    respond_to do |format|
      if @convenio.update_attributes(params[:convenio])
        format.html { redirect_to @convenio, notice: 'O Convenio foi alterado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @convenio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convenios/1
  # DELETE /convenios/1.json
  def destroy
    @convenio = Convenio.find(params[:id])
    @convenio.destroy

    respond_to do |format|
      format.html { redirect_to convenios_url }
      format.json { head :no_content }
    end
  end
end
