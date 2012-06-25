require "date"

class TcesController < ApplicationController
  # GET /tces
  # GET /tces.json
  def index
    @tces     = Tce.all
    @tces_v   = Array.new
    @tces_nv  = Array.new
    @tces.each do |tce|
      if tce.validado
        @tces_v   << tce
      else
        @tces_nv  << tce
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tces }
    end
  end

  # GET /tces/1
  # GET /tces/1.json
  def show
    @tce = Tce.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tce }
    end
  end

  # GET /tces/new
  # GET /tces/new.json
  def new
    @tce = Tce.new
    @tce.detalhe_termo = DetalheTermo.new
    @tce.detalhe_termo.endereco = Endereco.new
    @tce.detalhe_termo.seguradora = Seguradora.new
    @alunos = Aluno.all
    @convenios_array = Convenio.all.map { |conv| ["#{conv.concedente.nome} ~ #{conv.interveniente.nome}", conv.id]}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tce }
    end
  end

  # POST /tces
  # POST /tces.json
  def create
    @tce = Tce.new(params[:tce])
    @alunos = Aluno.all
    @convenios_array = Convenio.all.map { |conv| ["#{conv.concedente.nome} ~ #{conv.interveniente.nome}", conv.id]}    
    respond_to do |format|
      if @tce.save
        if params["hidConclusao"].to_i == 1
          format.html { redirect_to @tce, notice: 'Tce foi criado com sucesso.' }
        else
          #format.html { redirect_to @tce, notice: 'Tce was successfully created.' }
          format.html { redirect_to :action => "newHorasDias", :id => @tce.detalhe_termo.id}
          format.json { render json: @tce, status: :created, location: @tce }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @tce.errors, status: :unprocessable_entity }
      end
    end
  end

  def newHorasDias
    @detalhe_termo = DetalheTermo.find(@detalhe_termo_id = params[:id])
    @hora_dia = HoraDia.new
    @ar_horas_dias  = Array.new
  end
  
  def popularArrayHorasDias(parametro_inicio, parametro_final, dia_semana, detalhe_termo_id, hora_dia_ids)
    arr = Array.new
    for c in 0...parametro_inicio.length do
      cCampoInicio  = parametro_inicio[c]
      cCampoFinal   = parametro_final[c]
      data_inicial = DateTime.new(DateTime.now.year, 
      DateTime.now.month, DateTime.now.day, 
      cCampoInicio[:hour].to_i, cCampoInicio[:minute].to_i, 0)
      data_final = DateTime.new(DateTime.now.year, 
      DateTime.now.month, DateTime.now.day, 
      cCampoFinal[:hour].to_i, cCampoFinal[:minute].to_i, 0)
      hora_dia = (hora_dia_ids && (hora_dia_ids[c] && !hora_dia_ids[c].blank?)) ? HoraDia.find(hora_dia_ids[c]) : HoraDia.new
      hora_dia.detalhe_termo_id   = detalhe_termo_id
      hora_dia.dia_semana         = dia_semana
      hora_dia.inicio             = data_inicial
      hora_dia.final              = data_final
      hora_dia.tipo               = true
      arr << hora_dia     
    end
    arr
  end
#les_20b@googlegroups.com
  def createHorasDias
    @detalhe_termo  = DetalheTermo.find(@detalhe_termo_id = params[:hidId])
    @ar_horas_dias  = Array.new
    hora_dia        = HoraDia.new
    data_inicial = DateTime.new(DateTime.now.year, 
    DateTime.now.month, DateTime.now.day, 
    params[:horario_almoco_inicio][:hour].to_i, params[:horario_almoco_inicio][:minute].to_i, 0)
    data_final = DateTime.new(DateTime.now.year, 
    DateTime.now.month, DateTime.now.day, 
    params[:horario_almoco_final][:hour].to_i, params[:horario_almoco_final][:minute].to_i, 0)
    
    hora_dia.detalhe_termo_id  = params[:hidId]
    hora_dia.inicio            = data_inicial
    hora_dia.final             = data_final
    hora_dia.tipo              = false
    @ar_horas_dias << hora_dia    
    
  
    j = 0
    params[:dias_semana].each_key do |dia_semana|
      if (params[:campos_dia_semana][j].to_i == 1)
        popularArrayHorasDias(params[:dias_semana][dia_semana][:inicio], 
        params[:dias_semana][dia_semana][:final], j, params[:hidId], nil).each do |elem|
          @ar_horas_dias << elem
        end        
      end
      j += 1
    end
    if @detalhe_termo.update_attributes(:carga_horaria_semanal => params[:carga_horaria].to_i)       
      ada = ""
      #validando
      @ar_horas_dias.each do |ar|
        if !ar.valid?
          render "newHorasDias"
          return
        end
        #ada << ar.dia_semana.to_s + "<br />"
      end
      #salvando
      @ar_horas_dias.each do |ar|
        ar.save
      end      
      if params["hidConclusao"].to_i == 1
        redirect_to "/tces/#{Tce.where("detalhe_termo_id = ?", @detalhe_termo_id).first.id}", 
        notice: 'Tce foi criado com sucesso.'
      else      
        redirect_to :action => "newListaAtividades", :id => @detalhe_termo_id
      end
      #render :text => ada + "carga horaria: #{params[:carga_horaria]} <br /> #{@detalhe_termo.valid?.to_s}"
    else
      render "newHorasDias" 
    end
  end
  
  def newListaAtividades
    @detalhe_termo_id = params[:id]
    @tces = Tce.where("detalhe_termo_id = '#{@detalhe_termo_id}'")
    @lista_atividade = ListaAtividade.new
    @atividades = Atividade.where("curso_id = '#{@tces.first.aluno.curso_id}'")
  end
  
  def createListaAtividades
    @detalhe_termo_id = params[:hidId]
    params[:atividade].each do |at|
      lista_atividade = ListaAtividade.new
      lista_atividade.atividade_id = at
      lista_atividade.detalhe_termo_id = @detalhe_termo_id
      lista_atividade.save
    end
    redirect_to :action => "index"
  end

  def editListaAtividades
    @lista_atividade = ListaAtividade.new
    @lista_atividades = ListaAtividade.where("detalhe_termo_id = ?", 
    @detalhe_termo_id = (tce = Tce.find(params[:id])).detalhe_termo_id)
    @atividades = Atividade.where("curso_id = ?", tce.aluno.curso_id)
  end  
  def editHorasDias
    tce = Tce.find(params[:id])
    @detalhe_termo = DetalheTermo.find(@detalhe_termo_id = tce.detalhe_termo.id)
    @ar_horas_dias = Array.new
  end

  # GET /tces/1/edit
  def edit
    @tce = Tce.find(params[:id])
    @alunos = Aluno.all
    @convenios_array = Convenio.all.map { |conv| ["#{conv.concedente.nome} ~ #{conv.interveniente.nome}", conv.id]}
  end

  def updateListaAtividades
    @detalhe_termo_id = params[:hidId]
=begin
    params[:atividade].each do |at|
      lista_atividade = ListaAtividade.new
      lista_atividade.atividade_id = at
      lista_atividade.detalhe_termo_id = @detalhe_termo_id
      lista_atividade.save
    end
=end
    render :text => params
    #redirect_to :action => "index"    
  end

  def updateHorasDias
    @detalhe_termo = DetalheTermo.find(@detalhe_termo_id = params[:hidId])
    @ar_horas_dias = Array.new
    data_inicial = DateTime.new(DateTime.now.year, 
    DateTime.now.month, DateTime.now.day, 
    params[:horario_almoco_inicio][:hour].to_i, params[:horario_almoco_inicio][:minute].to_i, 0)
    data_final = DateTime.new(DateTime.now.year, 
    DateTime.now.month, DateTime.now.day, 
    params[:horario_almoco_final][:hour].to_i, params[:horario_almoco_final][:minute].to_i, 0)
    hora_dia                    = HoraDia.find(params[:hidHoraDiaIdAl])
    hora_dia.detalhe_termo_id   = params[:hidId]
    hora_dia.inicio             = data_inicial
    hora_dia.final              = data_final
    hora_dia.tipo               = false
    @ar_horas_dias << hora_dia    

    j = 0
    params[:dias_semana].each_key do |dia_semana|
      if (params[:campos_dia_semana][j].to_i == 1)
        @ar_horas_dias += popularArrayHorasDias(params[:dias_semana][dia_semana][:inicio], 
        params[:dias_semana][dia_semana][:final], j, params[:hidId], params[:hidHoraDiaId][dia_semana])
      #else
        #if ((hd = @detalhe_termo.hora_dias.where("dia_semana = ?", j)).exists?)
        #  hd.destroy_all
        #end
      end
      j += 1
    end
    if @detalhe_termo.update_attributes(:carga_horaria_semanal => params[:carga_horaria].to_i)      
      passou = false
      @detalhe_termo.hora_dias.all.each do |hd|
        @ar_horas_dias.each do |ar|
          passou = true if ar.id && hd.id == ar.id          
        end
        hd.destroy if !passou
        passou = false
      end
      ada = ""
      @ar_horas_dias.each do |ar|
        ar.save
        ada << ar.id.to_s + "<br />"
      end

      redirect_to "/tces/#{Tce.where("detalhe_termo_id = ?", @detalhe_termo_id).first.id}", 
      notice: 'Tce foi editado com sucesso.'
      #render :text => ada + "carga horaria: #{params[:carga_horaria]} <br /> #{@detalhe_termo.valid?.to_s}"
    else
      render "editHorasDias" 
    end    
  end

  # PUT /tces/1
  # PUT /tces/1.json
  def update
    @tce = Tce.find(params[:id])

    respond_to do |format|
      if @tce.update_attributes(params[:tce])
        format.html { redirect_to @tce, notice: 'Tce foi editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tces/1
  # DELETE /tces/1.json
  def destroy
    @tce = Tce.find(params[:id])
    @tce.destroy

    respond_to do |format|
      format.html { redirect_to tces_url }
      format.json { head :no_content }
    end
  end
end
