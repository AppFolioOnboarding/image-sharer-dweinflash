require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def test_valid_feedback
    @feedback = Feedback.new(user_name: 'David', comments: 'Test')
    assert_predicate @feedback, :valid?
  end

  def test_invalid_feedback_name
    @feedback = Feedback.new(user_name: '', comments: 'Test')
    assert_predicate @feedback, :invalid?
    assert @feedback.errors.messages.has_key?(:user_name)
  end

  def test_invalid_feedback_comments
    @feedback = Feedback.new(user_name: 'David', comments: '')
    assert_predicate @feedback, :invalid?
    assert @feedback.errors.messages.has_key?(:comments)
  end
end
