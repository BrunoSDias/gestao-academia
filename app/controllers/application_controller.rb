class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user ||= JsonWebToken.encode({ id: Treinador.first.id })
  end
end
