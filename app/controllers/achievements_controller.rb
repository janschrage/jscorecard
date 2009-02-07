# JScorecard
#
# Copyright (C) 2009 Jan Schrage <jan@jschrage.de>
# 
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU 
# General Public License as published by the Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with this program. 
# If not, see <http://www.gnu.org/licenses/>.
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
