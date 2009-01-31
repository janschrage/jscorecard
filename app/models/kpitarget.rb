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
