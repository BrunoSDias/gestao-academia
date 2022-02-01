class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if cookies[:user_id]
      decoded_user = JsonWebToken.decode(cookies[:user_id])
      if decoded_user[:type] == "Operador"
        @current_user ||= Operador.find(decoded_user[:id])
      elsif decoded_user[:type] == "Treinador"
        @current_user = Treinador.find(decoded_user[:id])
      end
    end
  end
end
