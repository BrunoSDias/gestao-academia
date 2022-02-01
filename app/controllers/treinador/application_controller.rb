class Treinador::ApplicationController < ApplicationController
  layout "treinador"
  before_action :authorize!

  def authorize!
    if !@current_user || !@current_user.is_a?(Treinador)
      redirect_to login_treinadors_path
    end
  end
end
