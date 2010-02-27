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

class GraphController < ApplicationController

  include Spark

  def kpi_sparkline
      report_date = session[:report_date]
      kpi = Kpi.find(params[:id])
      target = kpi.target_value_for(report_date)
      achievements = kpi.achievements.find(:all,:order => "report_date ASC",:conditions => ["report_date <= ?",report_date])
      data = []
      achievements.each do |a|
        data << a.kpivalue
      end
      img = Spark.plot(data, :height => 20, :target => target)
      send_data(img, :disposition => 'inline', :type => 'image/png', :filename => "kpi_sparkline-#{kpi.id}.png")
    end
  
end
