require 'test_helper'

class KpiTest < ActiveSupport::TestCase
  def test_create_empty
    k = Kpi.new()
    assert k.valid?
  end
end
