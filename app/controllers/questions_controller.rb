class QuestionsController < ApplicationController

  def index
    @questions = Question.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Question.create(title: question_params[:title], text: question_params[:text], user_id: current_user.id)
  end

  def destroy
      question = Question.find(params[:id])
      if question.user_id == current_user.id
        question.destroy
      end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.includes(:user).order("created_at DESC")
  end

  def search
    @questions = Question.where('text LIKE(?)', "%#{params[:keyword]}%")
  end

  private
  def question_params
    params.permit(:title, :text)
  end

end
