# frozen_string_literal: true

class PagesController < ApplicationController
  def homepage
    if current_user
      redirect_to page_path('menupage')
    end
  end

  def show
    render params[:id]
  end

  def menupage; end

  def paymentpage; end
end
