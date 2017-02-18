class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @questions = @user.questions.order("id DESC").page(params[:page]).per(5)
  end

end
