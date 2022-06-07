class Cliente::ClientesController < Cliente::ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]
  
  def show
  end

  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      if params['id'].to_i.positive?
        @cliente = Cliente.find(params['id'])
      else
        @cliente = Cliente.find(JsonWebToken.decode(params['id'])['id'])
      end
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params[:cliente][:whatsapp] = params[:cliente][:whatsapp].to_s.gsub(/\D/, '')
      params.require(:cliente).permit(:nome, :whatsapp, :email, :password)
    end
end
