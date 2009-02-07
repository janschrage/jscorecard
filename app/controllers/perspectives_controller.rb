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
class PerspectivesController < ApplicationController

  cache_sweeper :audit_sweeper

  # GET /perspectives
  # GET /perspectives.xml
  def index
    @perspectives = Perspective.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @perspectives }
    end
  end

  # GET /perspectives/1
  # GET /perspectives/1.xml
  def show
    @perspective = Perspective.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @perspective }
    end
  end

  # GET /perspectives/new
  # GET /perspectives/new.xml
  def new
    @perspective = Perspective.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @perspective }
    end
  end

  # GET /perspectives/1/edit
  def edit
    @perspective = Perspective.find(params[:id])
  end

  # POST /perspectives
  # POST /perspectives.xml
  def create
    @perspective = Perspective.new(params[:perspective])

    respond_to do |format|
      if @perspective.save
        flash[:notice] = 'Perspective was successfully created.'
        format.html { redirect_to(@perspective) }
        format.xml  { render :xml => @perspective, :status => :created, :location => @perspective }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @perspective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /perspectives/1
  # PUT /perspectives/1.xml
  def update
    @perspective = Perspective.find(params[:id])

    respond_to do |format|
      if @perspective.update_attributes(params[:perspective])
        flash[:notice] = 'Perspective was successfully updated.'
        format.html { redirect_to(@perspective) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @perspective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /perspectives/1
  # DELETE /perspectives/1.xml
  def destroy
    @perspective = Perspective.find(params[:id])
    @perspective.destroy

    respond_to do |format|
      format.html { redirect_to(perspectives_url) }
      format.xml  { head :ok }
    end
  end
end
