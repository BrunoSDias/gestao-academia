class Operador::TreinoTreinadorsController < Operador::ApplicationController
  before_action :set_treinador
  before_action :set_treino_treinador, only: %i[ show edit destroy update]

  def index
    @treino_treinadors = TreinoTreinador
    .joins(:treino)
    .joins(:treinador)
    .select([
      "treino_treinadors.id",
      "treino_treinadors.treino_id",
      "treino_treinadors.treinador_id",
      "treinos.nome as nome_treino",
      "treinadors.nome as nome_treinador"
    ])
  end

  # GET /treino_treinadors/1 or /treino_treinadors/1.json
  def show
  end

  # GET /treino_treinadors/new
  def new
    @treino_treinador = TreinoTreinador.new
  end

  # GET /treino_treinadors/1/edit
  def edit
  end

  # POST /treino_treinadors or /treino_treinadors.json
  def create
    @treino_treinador = TreinoTreinador.new(treino_treinador_params)

    respond_to do |format|
      if @treino_treinador.save
        format.html { redirect_to operador_treinador_treino_treinador_url(@treinador, @treino_treinador), notice: "TreinoTreinador was successfully created." }
        format.json { render :show, status: :created, location: @treino_treinador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treino_treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treino_treinadors/1 or /treino_treinadors/1.json
  def update
    respond_to do |format|
      if @treino_treinador.update(treino_treinador_params)
        format.html { redirect_to operador_treinador_treino_treinador_url(@treinador, @treino_treinador), notice: "TreinoTreinador was successfully updated." }
        format.json { render :show, status: :ok, location: @treino_treinador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treino_treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treino_treinadors/1 or /treino_treinadors/1.json
  def destroy
    @treino_treinador.destroy

    respond_to do |format|
      format.html { redirect_to operador_treinador_treino_treinadors_url(@treinador), notice: "TreinoTreinador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_treinador
    @treinador = Treinador.find(params[:treinador_id])
  end
  def set_treino_treinador
    @treino_treinador = TreinoTreinador.find(params[:id])
  end

  def treino_treinador_params
    params.require(:treino_treinador).permit(:treino_id, :treinador_id)
  end
end
