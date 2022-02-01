class Login::TreinadorsController < Login::ApplicationController
  def signin
  end

  def access
    treinador = Treinador.find_by(email: set_treinador_params[:email])

    if treinador && 
      (cookies[:qnt_tentativas].to_i < 3 || verify_recaptcha({message: "Você não preencheu o recaptcha"})) &&
      treinador.authenticate(set_treinador_params[:password])

        cookies[:qnt_tentativas] = nil
        cookies[:user_id] = { value: JsonWebToken.encode({ id: treinador.id, type: "Treinador" })}

        flash[:notice] = "Usuario logado com sucesso!"
        redirect_to treinador_root_path
    else
      cookies[:qnt_tentativas] = { value: cookies[:qnt_tentativas].to_i + 1, httponly: true }
      flash[:error] = "Email ou senha incorreta"
      render :signin
    end
  end

  private

  def set_treinador_params
    params.require(:treinador).permit(:email, :password)
  end
end
