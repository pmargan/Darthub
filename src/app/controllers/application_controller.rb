# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def check_login
    unless user_signed_in?
      flash[:error] = 'You must be signed in to access this page'
      redirect_to new_user_session_path
    end
  end
end
