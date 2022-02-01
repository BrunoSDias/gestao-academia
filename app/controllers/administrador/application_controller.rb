class Administrador::ApplicationController < ApplicationController
  layout "administrador"
  before_action :authorize!

  def authorize!
    if !@current_user || !@current_user.is_a?(Operador) || !@current_user.administrador
      redirect_to login_administradors_path
    end
  end
end
