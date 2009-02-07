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
class KpisController < ApplicationController

  cache_sweeper :audit_sweeper

  # GET /kpis
  # GET /kpis.xml
  def index
    @kpis = Kpi.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kpis }
    end
  end

  # GET /kpis/1
  # GET /kpis/1.xml
  def show
    @kpi = Kpi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kpi }
    end
  end

  # GET /kpis/new
  # GET /kpis/new.xml
  def new
    @kpi = Kpi.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kpi }
    end
  end

  # GET /kpis/1/edit
  def edit
    @kpi = Kpi.find(params[:id])
  end

  # POST /kpis
  # POST /kpis.xml
  def create
    @kpi = Kpi.new(params[:kpi])

    respond_to do |format|
      if @kpi.save
        flash[:notice] = 'Kpi was successfully created.'
        format.html { redirect_to(@kpi) }
        format.xml  { render :xml => @kpi, :status => :created, :location => @kpi }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kpi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kpis/1
  # PUT /kpis/1.xml
  def update
    @kpi = Kpi.find(params[:id])

    respond_to do |format|
      if @kpi.update_attributes(params[:kpi])
        flash[:notice] = 'Kpi was successfully updated.'
        format.html { redirect_to(@kpi) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kpi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kpis/1
  # DELETE /kpis/1.xml
  def destroy
    @kpi = Kpi.find(params[:id])
    @kpi.destroy

    respond_to do |format|
      format.html { redirect_to(kpis_url) }
      format.xml  { head :ok }
    end
  end
end
