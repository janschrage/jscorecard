class AchievementsController < ApplicationController
  
  cache_sweeper :audit_sweeper
 
  # GET /achievements
  # GET /achievements.xml
  def index
    @achievements = Achievement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @achievements }
    end
  end

  # GET /achievements/1
  # GET /achievements/1.xml
  def show
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @achievement }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.xml
  def new
    @achievement = Achievement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @achievement }
    end
  end

  # GET /achievements/1/edit
  def edit
    @achievement = Achievement.find(params[:id])
  end

  # POST /achievements
  # POST /achievements.xml
  def create
    @achievement = Achievement.new(params[:achievement])

    respond_to do |format|
      if @achievement.save
        flash[:notice] = 'Achievement was successfully created.'
        format.html { redirect_to(@achievement) }
        format.xml  { render :xml => @achievement, :status => :created, :location => @achievement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @achievement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /achievements/1
  # PUT /achievements/1.xml
  def update
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        flash[:notice] = 'Achievement was successfully updated.'
        format.html { redirect_to(@achievement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @achievement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.xml
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to(achievements_url) }
      format.xml  { head :ok }
    end
  end

  def new_for_kpi
    @achievement = Achievement.new
    @achievement.report_date = session[:report_date].to_s
    @achievement.kpi_id = params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @achievement }
    end

  end
end
