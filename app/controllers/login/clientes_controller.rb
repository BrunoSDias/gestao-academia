class Login::ClientesController < Login::ApplicationController
  skip_forgery_protection

  def access
    cliente = Cliente.find_by(email: set_cliente_params[:email])

    if cliente && cliente.password == params[:cliente][:password]
      render json: cliente.encoded, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end
  private
    def set_cliente_params
      params.require(:cliente).permit(:email, :password)
    end
end
