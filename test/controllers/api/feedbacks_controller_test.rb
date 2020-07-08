require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  def test_feedback_create
    assert_difference 'Feedback.count' do
      post api_feedbacks_path, params: {
        feedback: {
          user_name: 'David',
          comments: 'Test'
        }
      }
    end
    last_feedback = Feedback.last
    assert_equal 'David', last_feedback.user_name
    assert_equal 'Test', last_feedback.comments
  end
end
