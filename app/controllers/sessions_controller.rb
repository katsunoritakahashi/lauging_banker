class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to user
    else
      render root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
