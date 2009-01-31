require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  def test_create_empty
    a = Achievement.new()
    assert a.valid?
  end
end
