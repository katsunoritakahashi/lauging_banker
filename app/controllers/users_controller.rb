class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to new_investment_path
    else
      flash.now[:danger] = '名前が未入力です'
      render :new
    end
  end

  def index
    @investments = Investment.where(month: 12).paginate(page: params[:page], per_page: 20).order(created_at: :desc)
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
