class Operador::ApplicationController < ApplicationController
  layout "operador"
  before_action :authorize!

  def authorize!
    if !@current_user || !@current_user.is_a?(Operador) || @current_user.administrador
      redirect_to login_operadors_path
    end
  end
end
