class Login::OperadorsController < Login::ApplicationController
  def signin
  end

  def access
    operador = Operador.find_by(email: set_operador_params[:email], operador: false)

    if operador && 
      (cookies[:qnt_tentativas].to_i < 3 || verify_recaptcha({message: "Você não preencheu o recaptcha"})) &&
      operador.authenticate(set_operador_params[:password])

        cookies[:qnt_tentativas] = nil
        cookies[:user_id] = { value: JsonWebToken.encode({ id: operador.id, type: "Operador" })}

        flash[:notice] = "Usuario logado com sucesso!"
        redirect_to operador_root_path
    else
      cookies[:qnt_tentativas] = { value: cookies[:qnt_tentativas].to_i + 1, httponly: true }
      flash[:error] = "Email ou senha incorreta"
      render :signin
    end
  end

  private

  def set_operador_params
    params.require(:operador).permit(:email, :password)
  end
end
