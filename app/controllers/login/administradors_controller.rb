class Login::AdministradorsController < Login::ApplicationController
  def signin
  end

  def access
    administrador = Operador.find_by(email: set_administrador_params[:email], administrador: true)

    if administrador && 
      (cookies[:qnt_tentativas].to_i < 3 || verify_recaptcha({message: "Você não preencheu o recaptcha"})) &&
      administrador.authenticate(set_administrador_params[:password])

        cookies[:qnt_tentativas] = nil
        cookies[:user_id] = { value: JsonWebToken.encode({ id: administrador.id, type: "Operador" })}

        flash[:notice] = "Usuario logado com sucesso!"
        redirect_to administrador_root_path
    else
      cookies[:qnt_tentativas] = { value: cookies[:qnt_tentativas].to_i + 1, httponly: true }
      flash[:error] = "Email ou senha incorreta"
      render :signin
    end
  end

  private

  def set_administrador_params
    params.require(:administrador).permit(:email, :password)
  end
end
