class AnswersController < ApplicationController

  def create
    @answer = Answer.create(text: answer_params[:text], question_id: answer_params[:question_id], user_id: current_user.id)
    redirect_to "/questions/#{@answer.question.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def answer_params
    params.permit(:text, :question_id)
  end

end
