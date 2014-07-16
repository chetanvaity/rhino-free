class WidgetsController < ApplicationController
  # GET /widgets
  # GET /widgets.json
  def index
    @widgets = Widget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @widgets }
    end
  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
    @widget = Widget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @widget }
    end
  end

  # GET /widgets/new
  # GET /widgets/new.json
  def new
    @widget = Widget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @widget }
    end
  end

  # GET /widgets/1/edit
  def edit
    @widget = Widget.find(params[:id])
  end

  # POST /widgets
  # POST /widgets.json
  def create
    @widget = Widget.new(params[:widget])

    respond_to do |format|
      if @widget.save
        format.html { redirect_to @widget, notice: 'Widget was successfully created.' }
        format.json { render json: @widget, status: :created, location: @widget }
      else
        format.html { render action: "new" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /widgets/1
  # PUT /widgets/1.json
  def update
    @widget = Widget.find(params[:id])

    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        format.html { redirect_to @widget, notice: 'Widget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to widgets_url }
      format.json { head :no_content }
    end
  end

  # AJAX call
  # Used by loc_map, path_map, table, single_gauge, sensor_panel widgets
  def getData
    @widget = Widget.find(params[:id])
    wtype = WidgetType.find(@widget.widget_type_id)
    
    # Return a hash of datas obtained from each source
    srcdata = {}
    str2lst(@widget.sources).each do |source_id|
      src = Source.find(source_id)
      # TBD: There is a TS call inside. Make this non-blocking, also catch error and put error in the hash
      sdata = src.getData()
      logger.debug("getData():sdata = #{sdata}")
      srcdata[source_id] = sdata
    end
    logger.debug("getData():srcdata = #{srcdata}")

    metadata = WidgetType.getMetaData(srcdata)
    data = {:srcdata => srcdata, :metadata => metadata}

    # The final returned hash looks like this
    # data -> {
    #          srcdata -> { ... },
    #          metadata -> { ... }
    #         };
    render :json => {:data => data}
  end
  
  # AJAX call for getting source properties
  # Used by google cal widget
  def getProperties
    @widget = Widget.find(params[:id])
    wtype = WidgetType.find(@widget.widget_type_id)

    # Return a hash of properties obtained from each source
    # TBD: Currently used for cal widget. Can be used to send authentication tokens
    srcdata = {}
    str2lst(@widget.sources).each do |source_id|
      src = Source.find(source_id)
      sdata = src.getProperties()
      #logger.debug("getProperties():sdata = #{sdata}")
      srcdata[source_id] = sdata
    end

    data = {:srcdata => srcdata}
    #logger.debug("getProperties():data = #{data}")

    # The final returned hash looks like this
    # data -> {
    #          srcdata -> { ... },
    #         };
    render :json => {:data => data}
  end

end
