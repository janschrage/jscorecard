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
end
