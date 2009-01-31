require 'test_helper'

class TargetTest < ActiveSupport::TestCase

  def test_create_empty
    t = Target.new()
    assert t.valid?
  end
end
