class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @questions = current_user.questions.order("id DESC").page(params[:page]).per(5)
  end
  
end
