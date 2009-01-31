require 'test_helper'

class KpitargetTest < ActiveSupport::TestCase
  def test_create_empty
    k = Kpitarget.new()
    assert k.valid?
  end
end
