class AlunosController < ApplicationController
  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = Aluno.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alunos }
    end
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
    @aluno = Aluno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aluno }
    end
  end

  # GET /alunos/new
  # GET /alunos/new.json
  def new
    @aluno = Aluno.new
    @aluno.endereco = Endereco.new
    @cursos = Curso.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aluno }
    end
  end

  # GET /alunos/1/edit
  def edit
    @aluno = Aluno.find(params[:id])
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(params[:aluno])
    @cursos = Curso.all
    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno foi criado com sucesso!' }
        format.json { render json: @aluno, status: :created, location: @aluno }
      else
        format.html { render action: "new" }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alunos/1
  # PUT /alunos/1.json
  def update
    @aluno = Aluno.find(params[:id])
    respond_to do |format|
      if @aluno.update_attributes(params[:aluno])
        format.html { redirect_to @aluno, notice: 'Aluno foi alterado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno = Aluno.find(params[:id])    
    @aluno.destroy
    
    respond_to do |format|
      format.html { redirect_to alunos_url }
      format.json { head :no_content }
    end
  end
end
