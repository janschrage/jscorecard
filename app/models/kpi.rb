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

class Kpi < ActiveRecord::Base
  belongs_to :target
  has_many   :kpitargets
  has_many   :achievements

  def target_value_for(report_date)
    begin
      target_value=self.kpitargets.find(:first,:conditions => ["begda <= ? and endda >= ?",report_date,report_date]).target_value
    rescue
      return 0 #no value found, fail gently
    else
      return target_value
    end
  end

  def last_achieved_value(report_date)
    #Finds the last achievement before report_date
    report_date = Date::today unless report_date
    begin
      last_achieved=self.achievements.find(:first,:order => "report_date DESC",:conditions => ["report_date <= ?",report_date]).kpivalue
    rescue
      return 0  #no value found, fail gently
    else
      return last_achieved
    end
  end

  def achievement_for(report_date)
  # Used to find values for data entry screen by date
    achievement=self.achievements.find_by_report_date(report_date)
    return achievement
  end
  
  def achievement_percentage(report_date)
    target = target_value_for(report_date)
    achieved = last_achieved_value(report_date)
    bigger_is_better = self.bigger_is_better
    if !target.nil? and !achieved.nil?
    	perc=(1000*(target-achieved)/target + 0.5).truncate/10 unless target == 0
    end
    if !perc.nil?
      perc = 100 - perc if bigger_is_better
      perc = 100 + perc if !bigger_is_better
    end
    return perc
  end

  def achievement_rating(report_date)
    percentage = achievement_percentage(report_date)
    return "N/A" if percentage.nil? 
    threshold_1 = 90
    threshold_2 = 60
    return "ok"   if percentage >= threshold_1
    return "improve" if percentage >= threshold_2
    return "failing"
  end
  
  def sparkline(report_date)
    target = target_value_for(report_date)
    achievements = self.achievements.find(:all,:order => "report_date ASC",:conditions => ["report_date <= ?",report_date])
    data = []
    achievements.each do |a|
      data << a.kpivalue
    end
    Sparklines.plot(data, :type => bar, :height => 10, :target => target)
  end
end
