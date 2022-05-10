class Cliente::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  before_action :force_json
  before_action :authorize!

  def authorize!
    header = request.headers['AuthToken']

    if header.blank?
      render json: { message: "É necessário um token de autorização"}, status: :unauthorized
      return
    end

    if header.split(' ').count != 2
      render json: { message: "Seu token de autorização é inválido"}, status: :unauthorized
      return
    end

    if !header.split(' ')[0].match(/^Bearer$/i)
      render json: { message: "Seu token de autorização é inválido"}, status: :unauthorized
      return
    end

    begin
      id_decoded = JsonWebToken.decode(header.split(' ')[1])['id']
      @current_user = Cliente.find(id_decoded)
      if !@current_user
        render json: { message: "Este usuário não tem permissão"}, status: :unauthorized
      end
    rescue JWT.DecodeError => e
      render json: { message: "Token inválido" }, status: :unauthorized
    end
  end

  private
    def force_json
      request.format = 'json'
    end
end
