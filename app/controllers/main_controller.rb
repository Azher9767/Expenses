class MainController < ApplicationController
  def index
    flash[:notice] = "Logged in successfully"
    flash[:alert] = "invalid login credentials"

    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
end