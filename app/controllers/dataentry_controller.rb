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
