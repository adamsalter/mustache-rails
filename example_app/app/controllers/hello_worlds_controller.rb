class HelloWorldsController < ApplicationController
  # GET /hello_worlds
  # GET /hello_worlds.xml
  def index
    @hello_worlds = HelloWorld.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hello_worlds }
    end
  end

  # GET /hello_worlds/1
  # GET /hello_worlds/1.xml
  def show
    @hello_world = HelloWorld.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hello_world }
    end
  end

  # GET /hello_worlds/new
  # GET /hello_worlds/new.xml
  def new
    @hello_world = HelloWorld.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hello_world }
    end
  end

  # GET /hello_worlds/1/edit
  def edit
    @hello_world = HelloWorld.find(params[:id])
  end

  # POST /hello_worlds
  # POST /hello_worlds.xml
  def create
    @hello_world = HelloWorld.new(params[:hello_world])

    respond_to do |format|
      if @hello_world.save
        flash[:notice] = 'HelloWorld was successfully created.'
        format.html { redirect_to(@hello_world) }
        format.xml  { render :xml => @hello_world, :status => :created, :location => @hello_world }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hello_world.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hello_worlds/1
  # PUT /hello_worlds/1.xml
  def update
    @hello_world = HelloWorld.find(params[:id])

    respond_to do |format|
      if @hello_world.update_attributes(params[:hello_world])
        flash[:notice] = 'HelloWorld was successfully updated.'
        format.html { redirect_to(@hello_world) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hello_world.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hello_worlds/1
  # DELETE /hello_worlds/1.xml
  def destroy
    @hello_world = HelloWorld.find(params[:id])
    @hello_world.destroy

    respond_to do |format|
      format.html { redirect_to(hello_worlds_url) }
      format.xml  { head :ok }
    end
  end
end
