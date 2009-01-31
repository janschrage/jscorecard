class KpitargetsController < ApplicationController
  # GET /kpitargets
  # GET /kpitargets.xml
  def index
    @kpitargets = Kpitarget.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kpitargets }
    end
  end

  # GET /kpitargets/1
  # GET /kpitargets/1.xml
  def show
    @kpitarget = Kpitarget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kpitarget }
    end
  end

  # GET /kpitargets/new
  # GET /kpitargets/new.xml
  def new
    @kpitarget = Kpitarget.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kpitarget }
    end
  end

  # GET /kpitargets/1/edit
  def edit
    @kpitarget = Kpitarget.find(params[:id])
  end

  # POST /kpitargets
  # POST /kpitargets.xml
  def create
    @kpitarget = Kpitarget.new(params[:kpitarget])

    respond_to do |format|
      if @kpitarget.save
        flash[:notice] = 'Kpitarget was successfully created.'
        format.html { redirect_to(@kpitarget) }
        format.xml  { render :xml => @kpitarget, :status => :created, :location => @kpitarget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kpitarget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kpitargets/1
  # PUT /kpitargets/1.xml
  def update
    @kpitarget = Kpitarget.find(params[:id])

    respond_to do |format|
      if @kpitarget.update_attributes(params[:kpitarget])
        flash[:notice] = 'Kpitarget was successfully updated.'
        format.html { redirect_to(@kpitarget) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kpitarget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kpitargets/1
  # DELETE /kpitargets/1.xml
  def destroy
    @kpitarget = Kpitarget.find(params[:id])
    @kpitarget.destroy

    respond_to do |format|
      format.html { redirect_to(kpitargets_url) }
      format.xml  { head :ok }
    end
  end
end
