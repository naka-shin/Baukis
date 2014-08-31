class Admin::Base < ApplicationController
  private
  def current_administrator
    if session[:administrator_id]
      @current_staff_member ||=
        Administrator.find_by(id: session[:administrator_id]).first
    end
  end

  helper_method :current_administrator
end