# frozen_string_literal: true

class PagesController < ApplicationController
  def homepage
    if current_user
      if current_user.has_role?('admin')
        redirect_to page_path('adminpage')
      elsif user_signed_in?
        redirect_to page_path('menupage')
      end
    end
  end

  def show
    render params[:id]
  end

  def menupage; end

  def adminpage; end

  def paymentpage; end
end
