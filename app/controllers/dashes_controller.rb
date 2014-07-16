class DashesController < ApplicationController
  # GET /dashes
  # GET /dashes.json
  def index
    @dashes = Dash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashes }
    end
  end

  # GET /dashes/1
  # GET /dashes/1.json
  def show
    @dash = Dash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dash }
    end
  end

  # GET /dashes/new
  # GET /dashes/new.json
  def new
    @dash = Dash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dash }
    end
  end

  # GET /dashes/1/edit
  def edit
    @dash = Dash.find(params[:id])
  end

  # POST /dashes
  # POST /dashes.json
  def create
    @dash = Dash.new(params[:dash])

    respond_to do |format|
      if @dash.save
        format.html { redirect_to @dash, notice: 'Dash was successfully created.' }
        format.json { render json: @dash, status: :created, location: @dash }
      else
        format.html { render action: "new" }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dashes/1
  # PUT /dashes/1.json
  def update
    @dash = Dash.find(params[:id])

    respond_to do |format|
      if @dash.update_attributes(params[:dash])
        format.html { redirect_to @dash, notice: 'Dash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashes/1
  # DELETE /dashes/1.json
  def destroy
    @dash = Dash.find(params[:id])
    @dash.destroy

    respond_to do |format|
      format.html { redirect_to dashes_url }
      format.json { head :no_content }
    end
  end
  
  # Display this dash
  def display
    @dash = Dash.find(params[:id])
    widget_list = str2lst(@dash.widgets)
    @widgets = Widget.find(widget_list)

    dtype = DashType.find(@dash.dash_type_id)
    dash_template = "dashes/display_#{dtype.name}"
    render :template => dash_template, :formats => [:html], :handlers => "haml"
  end


end
