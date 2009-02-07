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
class TargetsController < ApplicationController

  cache_sweeper :audit_sweeper

  # GET /targets
  # GET /targets.xml
  def index
    @targets = Target.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @targets }
    end
  end

  # GET /targets/1
  # GET /targets/1.xml
  def show
    @target = Target.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @target }
    end
  end

  # GET /targets/new
  # GET /targets/new.xml
  def new
    @target = Target.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @target }
    end
  end

  # GET /targets/1/edit
  def edit
    @target = Target.find(params[:id])
  end

  # POST /targets
  # POST /targets.xml
  def create
    @target = Target.new(params[:target])

    respond_to do |format|
      if @target.save
        flash[:notice] = 'Target was successfully created.'
        format.html { redirect_to(@target) }
        format.xml  { render :xml => @target, :status => :created, :location => @target }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @target.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /targets/1
  # PUT /targets/1.xml
  def update
    @target = Target.find(params[:id])

    respond_to do |format|
      if @target.update_attributes(params[:target])
        flash[:notice] = 'Target was successfully updated.'
        format.html { redirect_to(@target) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @target.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.xml
  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to(targets_url) }
      format.xml  { head :ok }
    end
  end
end
