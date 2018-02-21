class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)

    @answer.save
    redirect_to @answer.comment.commentable
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :comment_id)
  end
end
