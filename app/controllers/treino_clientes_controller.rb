class TreinoClientesController < ApplicationController
  layout "treinador"
  before_action :set_treinador
  before_action :set_treino_cliente, only: %i[ show edit update destroy ]

  # GET /treino_clientes or /treino_clientes.json
  def index
    @treino_clientes = TreinoCliente.all
  end

  # GET /treino_clientes/1 or /treino_clientes/1.json
  def show
  end

  # GET /treino_clientes/new
  def new
    @treino_cliente = TreinoCliente.new
  end

  # GET /treino_clientes/1/edit
  def edit
  end

  # POST /treino_clientes or /treino_clientes.json
  def create
    @treino_cliente = TreinoCliente.new(treino_cliente_params)

    respond_to do |format|
      if @treino_cliente.save
        format.html { redirect_to treino_cliente_url(@treino_cliente), notice: "Treino cliente was successfully created." }
        format.json { render :show, status: :created, location: @treino_cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treino_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treino_clientes/1 or /treino_clientes/1.json
  def update
    respond_to do |format|
      if @treino_cliente.update(treino_cliente_params)
        format.html { redirect_to treino_cliente_url(@treino_cliente), notice: "Treino cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @treino_cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treino_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treino_clientes/1 or /treino_clientes/1.json
  def destroy
    @treino_cliente.destroy

    respond_to do |format|
      format.html { redirect_to treino_clientes_url, notice: "Treino cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treino_cliente
      @treino_cliente = TreinoCliente.find(params[:id])
    end

    def set_treinador
      @treinador = Treinador.find_decoded(@current_user)
    end

    # Only allow a list of trusted parameters through.
    def treino_cliente_params
      params.require(:treino_cliente).permit(:cliente_id, :treino_id, :dia_semana)
    end
end
