class ApplicationController < ActionController::Base
    helper_method :current_user
  
    private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      # Handle case where user with the stored session ID doesn't exist
      session[:user_id] = nil
      nil
    end
  end
  