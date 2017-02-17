class QuestionsController < ApplicationController

  def index
    @questions = Question.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Question.create(title: question_params[:title], text: question_params[:text], user_id: current_user.id)
  end

  private
  def question_params
    params.permit(:title, :text)
  end

end
