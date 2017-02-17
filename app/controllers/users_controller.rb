class UsersController < ApplicationController

  def show
    @questions = current_user.questions.order("id DESC").page(params[:page]).per(5)
  end
end
