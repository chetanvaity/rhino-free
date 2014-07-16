require 'net/http'

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    # Create TS channel first
    # TBD: Hardcoding: Thingspeak, IP etc.
    # TBD: error handling
    ts_url = "#{TSURL}/channels/createchannel"
    json_str = Net::HTTP.get(URI.parse(ts_url))
    logger.debug("json_str = #{json_str}")

    #Parse return data and extract channel id and key
    data_str = ActiveSupport::JSON.decode(json_str)
    logger.debug("data_str = #{data_str}")
    data = data_str["data"]
    logger.debug("data = #{data}")

    channel_id = data["chid"] 
    key = data["key"]

    logger.debug("data(chid, key) = #{channel_id} #{key}")

    # TBD remove this ugly hack!
    # prop set to key and channel feed
    prop = %&{"user":"#{@user.name}", "url":"#{TSURL}/channels/#{channel_id}/feeds/last.json?location=true", "key":"#{key}"}&
    logger.debug("prop = #{prop}")

    # Create a source for this user (using the TS channel)
    # TBD: hardcoding source_type_id
    s = Source.new(:name => "#{@user.name} location", :source_type_id => 1, :properties => prop)
    s.save

    @user.source_id = s.id

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # AJAX call
  def search()
    query = params[:q];
    ulist = User.where("name like \"%#{query}%\"")
    render :json => {:ulist => ulist}
  end

end
