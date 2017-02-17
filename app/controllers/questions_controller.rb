class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    new_question = Question.new(question_params)
    new_question.image = 'http://free-webdesigner.com/fw/wp-content/uploads/2014/10/stationery5.gif'
    new_question.save
  end

  private
  def question_params
    params.permit(:title, :text)
  end

end
