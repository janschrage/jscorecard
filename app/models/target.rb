class Target < ActiveRecord::Base
  has_many   :kpis
  belongs_to :perspective
end
