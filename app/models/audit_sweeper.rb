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

class AuditSweeper < ActionController::Caching::Sweeper
  observe Kpi, Kpitarget, Achievement, Perspective, Target

  def after_destroy(record)
    log(record, "DESTROY" )
  end

  def after_update(record)
    log(record, "UPDATE" )
  end

  def after_create(record)
    log(record, "CREATE" )
  end

  def log(record, event, user = 0)
    # Workaround for JS update
    user=controller.session[:user_id] if !controller.nil?

    AuditTrail.create(:record_id => record.id, :record_type => record.class.name, :event => event, :user_id => user)
  end
end
