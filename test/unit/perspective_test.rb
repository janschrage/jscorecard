require 'test_helper'

class PerspectiveTest < ActiveSupport::TestCase

  def test_create_empty
    p = Perspective.new()
    assert p.valid?
  end
end
