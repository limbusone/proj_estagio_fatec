class HoraDiaController < ApplicationController
  # GET /hora_dia
  # GET /hora_dia.json
  def index
    @hora_dia = HoraDium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hora_dia }
    end
  end

  # GET /hora_dia/1
  # GET /hora_dia/1.json
  def show
    @hora_dium = HoraDium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hora_dium }
    end
  end

  # GET /hora_dia/new
  # GET /hora_dia/new.json
  def new
    @hora_dium = HoraDium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hora_dium }
    end
  end

  # GET /hora_dia/1/edit
  def edit
    @hora_dium = HoraDium.find(params[:id])
  end

  # POST /hora_dia
  # POST /hora_dia.json
  def create
    @hora_dium = HoraDium.new(params[:hora_dium])

    respond_to do |format|
      if @hora_dium.save
        format.html { redirect_to @hora_dium, notice: 'Hora dium was successfully created.' }
        format.json { render json: @hora_dium, status: :created, location: @hora_dium }
      else
        format.html { render action: "new" }
        format.json { render json: @hora_dium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hora_dia/1
  # PUT /hora_dia/1.json
  def update
    @hora_dium = HoraDium.find(params[:id])

    respond_to do |format|
      if @hora_dium.update_attributes(params[:hora_dium])
        format.html { redirect_to @hora_dium, notice: 'Hora dium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hora_dium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hora_dia/1
  # DELETE /hora_dia/1.json
  def destroy
    @hora_dium = HoraDium.find(params[:id])
    @hora_dium.destroy

    respond_to do |format|
      format.html { redirect_to hora_dia_url }
      format.json { head :no_content }
    end
  end
end
