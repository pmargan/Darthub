# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name, :first_name, :last_name, :street_number, :street_name, :city, :state)
  end
end
