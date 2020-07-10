module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(feedback_params)
      if @feedback.save
        render json: { message: 'Save Successful' }, status: :ok
      else
        render json: { error: @feedback.errors.messages}, status: :unprocessable_entity
      end
    end

    private

    def feedback_params
      params.require(:feedback).permit(:user_name, :comments)
    end
  end
end
