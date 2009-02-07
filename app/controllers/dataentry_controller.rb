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
class DataentryController < ApplicationController

  def index
    @entry_variables={ :report_date => Date::today.to_s }
  end

  def enter_data
    @perspectives = Perspective.find(:all)
    @report_date  = params[:entry_variables][:report_date].to_date
    session[:report_date] = @report_date.to_s
  end

  def new
    achievement = Achievement.new()
    achievement.report_date = session[:report_date].to_date
    achievement.kpi_id = params[:id]
    achievement.kpivalue = params[:value]
    achievement.save
    achievement.reload
    render :text => achievement.kpivalue
  end

  def update
    achievement = Achievement.find(params[:id])
    achievement.kpivalue = params[:value]
    achievement.save
    achievement.reload
    render :text => achievement.kpivalue
  end


end
