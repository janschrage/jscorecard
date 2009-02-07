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
    target_value=self.kpitargets.find(:first,:conditions => ["begda <= ? and endda >= ?",report_date,report_date])
    return target_value.target_value
  end

  def last_achieved_value
    v=self.achievements.find(:first,:order => "report_date DESC")
    return v.kpivalue unless v.nil?
  end

  def achievement_for(report_date)
    v=self.achievements.find_by_report_date(report_date)
    return v unless v.nil?
  end
  
  def achievement_percentage(report_date)
    target = target_value_for(report_date)
    achieved = last_achieved_value
    perc=(1000*(target-achieved)/target + 0.5).truncate/10 unless target.nil? or achieved.nil?
    if !perc.nil?
      perc = 100 - perc if self.bigger_is_better 
      perc = 100 + perc if !self.bigger_is_better
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
end
