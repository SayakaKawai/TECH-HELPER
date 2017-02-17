class QuestionsController < ApplicationController

  def index
    @question = Question.all
  end

  def new
  end

end
