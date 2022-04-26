class Cliente::ApplicationController < ApplicationController
  before_action :force_json
  before_action :authorize!

  def authorize!
    header = request.headers['AuthToken']

    if header.blank?
      render json: { message: "É necessário um token de autorização"}, status: :unauthorized
    end

    if header.split(' ').count != 2
      render json: { message: "Seu token de autorização é inválido"}, status: :unauthorized
    end

    if !header.split(' ')[0].match(/^Bearer$/i)
      render json: { message: "Seu token de autorização é inválido"}, status: :unauthorized
    end

    begin
      id_decoded = JsonWebToken.decode(header.split(' ')[1])['id']
      if !Cliente.find(id_decoded)
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
