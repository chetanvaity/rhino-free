class WidgetTypesController < ApplicationController
  # GET /widget_types
  # GET /widget_types.json
  def index
    @widget_types = WidgetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @widget_types }
    end
  end

  # GET /widget_types/1
  # GET /widget_types/1.json
  def show
    @widget_type = WidgetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @widget_type }
    end
  end

  # GET /widget_types/new
  # GET /widget_types/new.json
  def new
    @widget_type = WidgetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @widget_type }
    end
  end

  # GET /widget_types/1/edit
  def edit
    @widget_type = WidgetType.find(params[:id])
  end

  # POST /widget_types
  # POST /widget_types.json
  def create
    @widget_type = WidgetType.new(params[:widget_type])

    respond_to do |format|
      if @widget_type.save
        format.html { redirect_to @widget_type, notice: 'Widget type was successfully created.' }
        format.json { render json: @widget_type, status: :created, location: @widget_type }
      else
        format.html { render action: "new" }
        format.json { render json: @widget_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /widget_types/1
  # PUT /widget_types/1.json
  def update
    @widget_type = WidgetType.find(params[:id])

    respond_to do |format|
      if @widget_type.update_attributes(params[:widget_type])
        format.html { redirect_to @widget_type, notice: 'Widget type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @widget_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widget_types/1
  # DELETE /widget_types/1.json
  def destroy
    @widget_type = WidgetType.find(params[:id])
    @widget_type.destroy

    respond_to do |format|
      format.html { redirect_to widget_types_url }
      format.json { head :no_content }
    end
  end
end
