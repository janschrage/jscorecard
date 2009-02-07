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

class Kpitarget < ActiveRecord::Base
  belongs_to :kpi
  
  #validate :no_overlap

protected
  
  def no_overlap
    ov=Kpitarget.find(:all, :conditions => ["kpi_id = ? and begda <= ? and endda >= ?",kpi_id,endda,begda])
    errors.add(:begda,"Overlap with identical KPI target value.") unless ov.blank?
    errors.add(:endda,"Overlap with identical KPI target value.") unless ov.blank?
  end
end
