class QuestionsController < ApplicationController

  def index
    @question = Question.all.order("id DESC")
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
