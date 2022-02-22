class Operador::TreinoClientesController < Operador::ApplicationController
  before_action :set_cliente
  before_action :set_treino_cliente, only: %i[ show edit destroy update]

  def index
    @treino_clientes = TreinoCliente
    .joins(:treino)
    .where(treino_clientes: { cliente_id: @cliente.id })
    .select([
      "treino_clientes.id",
      "treinos.nome as nome_treino",
      "treino_clientes.treino_id",
    ])
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
        ordena_exercicios!(@treino_cliente)
        format.html { redirect_to operador_cliente_treino_cliente_url(@cliente, @treino_cliente), notice: "TreinoCliente was successfully created." }
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
        ordena_exercicios!(@treino_cliente)
        format.html { redirect_to operador_cliente_treino_cliente_url(@cliente, @treino_cliente), notice: "TreinoCliente was successfully updated." }
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
      format.html { redirect_to operador_cliente_treino_clientes_url(@cliente), notice: "TreinoCliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def ordena_exercicios!(treino_cliente)
      ExercicioTreinoCliente.where(treino_cliente_id: treino_cliente.id)&.delete_all
      exercicio_ids = Exercicio.where(treino_id: treino_cliente.treino_id).pluck(:id)
      exercicio_ids.each.with_index(1) do |exercicio_id, i|
        ExercicioTreinoCliente.create(exercicio_id: exercicio_id, treino_cliente_id: treino_cliente.id, ordem: i)
      end
    end

    def set_cliente
      @cliente = Cliente.find(params[:cliente_id])
    end
    def set_treino_cliente
      @treino_cliente = TreinoCliente.find(params[:id])
    end

  def treino_cliente_params
    params.require(:treino_cliente).permit(:treino_id, :cliente_id, :dia_semana)
  end 
end
