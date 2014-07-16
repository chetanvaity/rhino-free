class DashTypesController < ApplicationController
  # GET /dash_types
  # GET /dash_types.json
  def index
    @dash_types = DashType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dash_types }
    end
  end

  # GET /dash_types/1
  # GET /dash_types/1.json
  def show
    @dash_type = DashType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dash_type }
    end
  end

  # GET /dash_types/new
  # GET /dash_types/new.json
  def new
    @dash_type = DashType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dash_type }
    end
  end

  # GET /dash_types/1/edit
  def edit
    @dash_type = DashType.find(params[:id])
  end

  # POST /dash_types
  # POST /dash_types.json
  def create
    @dash_type = DashType.new(params[:dash_type])

    respond_to do |format|
      if @dash_type.save
        format.html { redirect_to @dash_type, notice: 'Dash type was successfully created.' }
        format.json { render json: @dash_type, status: :created, location: @dash_type }
      else
        format.html { render action: "new" }
        format.json { render json: @dash_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dash_types/1
  # PUT /dash_types/1.json
  def update
    @dash_type = DashType.find(params[:id])

    respond_to do |format|
      if @dash_type.update_attributes(params[:dash_type])
        format.html { redirect_to @dash_type, notice: 'Dash type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dash_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dash_types/1
  # DELETE /dash_types/1.json
  def destroy
    @dash_type = DashType.find(params[:id])
    @dash_type.destroy

    respond_to do |format|
      format.html { redirect_to dash_types_url }
      format.json { head :no_content }
    end
  end
end
