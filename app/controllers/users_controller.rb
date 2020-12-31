class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      flash.now[:danger] = '人生を託すことが出来ませんでした'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :saving, :income)
  end
end