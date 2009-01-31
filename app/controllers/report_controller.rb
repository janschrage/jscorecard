class ReportController < ApplicationController

  def index
    @perspectives = Perspective.find(:all)
  end
end
