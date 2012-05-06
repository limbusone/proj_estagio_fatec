class TaController < ApplicationController
  # GET /ta
  # GET /ta.json
  def index
    @ta = Ta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ta }
    end
  end

  # GET /ta/1
  # GET /ta/1.json
  def show
    @tum = Ta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tum }
    end
  end

  # GET /ta/new
  # GET /ta/new.json
  def new
    @tum = Ta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tum }
    end
  end

  # GET /ta/1/edit
  def edit
    @tum = Ta.find(params[:id])
  end

  # POST /ta
  # POST /ta.json
  def create
    @tum = Ta.new(params[:tum])

    respond_to do |format|
      if @tum.save
        format.html { redirect_to @tum, notice: 'Ta was successfully created.' }
        format.json { render json: @tum, status: :created, location: @tum }
      else
        format.html { render action: "new" }
        format.json { render json: @tum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ta/1
  # PUT /ta/1.json
  def update
    @tum = Ta.find(params[:id])

    respond_to do |format|
      if @tum.update_attributes(params[:tum])
        format.html { redirect_to @tum, notice: 'Ta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ta/1
  # DELETE /ta/1.json
  def destroy
    @tum = Ta.find(params[:id])
    @tum.destroy

    respond_to do |format|
      format.html { redirect_to ta_index_url }
      format.json { head :no_content }
    end
  end
end
