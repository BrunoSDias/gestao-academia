class Login::ApplicationController < ApplicationController
  skip_before_action :set_current_user
  layout "login"

  def signout
    cookies[:user_id] = nil
    redirect_to '/'
  end
end
