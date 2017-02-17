class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("id DESC").page(params[:page]).per(3)
  end

  def new
  end

  def create
    Question.create(question_params)
  end

  private
  def question_params
    params.permit(:title, :image, :text)
  end

end
