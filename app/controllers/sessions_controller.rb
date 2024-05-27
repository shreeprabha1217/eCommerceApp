# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      # Successful login
      session[:user_id] = user.id
      redirect_to products_path, notice: "Logged in successfully"
    else
      # Failed login
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end
end