class QuestionsController < ApplicationController

  before_action :yetanswer_questions

  def yetanswer_questions
    y = []
    allquestions = Question.all
    allquestions.each do |question|
      if question.answers.count == 0
        y << question.id
      end
    end
    yet_answers = Question.where(id: y)
    @yet = yet_answers.order("id DESC").limit(5)
  end

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

  def yet
    y = []
    allquestions = Question.all
    allquestions.each do |question|
      if question.answers.count == 0
        y << question.id
      end
    end
    yet_answers = Question.where(id: y)
    @yet_question_all = yet_answers.order("id DESC")
  end

  private
  def question_params
    params.permit(:title, :text)
  end

end