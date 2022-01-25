class LoginTreinadorController < ApplicationController
  def signin
  end

  def access
    if verify_recaptcha({message: "Você não preencheu o recaptcha"})
      flash[:notice] = "Usuario logado com sucesso!"
      render :signin
    else
      render :signin
    end
  end
end
