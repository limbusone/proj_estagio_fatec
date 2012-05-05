class TcesController < ApplicationController
  # GET /tces
  # GET /tces.json
  def index
    @tces = Tce.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tce }
    end
  end

  # GET /tces/1/edit
  def edit
    @tce = Tce.find(params[:id])
  end

  # POST /tces
  # POST /tces.json
  def create
    @tce = Tce.new(params[:tce])

    respond_to do |format|
      if @tce.save
        format.html { redirect_to @tce, notice: 'Tce was successfully created.' }
        format.json { render json: @tce, status: :created, location: @tce }
      else
        format.html { render action: "new" }
        format.json { render json: @tce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tces/1
  # PUT /tces/1.json
  def update
    @tce = Tce.find(params[:id])

    respond_to do |format|
      if @tce.update_attributes(params[:tce])
        format.html { redirect_to @tce, notice: 'Tce was successfully updated.' }
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
