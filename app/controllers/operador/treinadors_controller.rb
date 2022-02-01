class Operador::TreinadorsController < Operador::ApplicationController
  layout 'treinador'

  before_action :set_treinador, only: %i[ show edit update destroy ]

  # GET /treinadors or /treinadors.json
  def index
    @treinadors = Treinador.all
  end

  # GET /treinadors/1 or /treinadors/1.json
  def show
  end

  # GET /treinadors/new
  def new
    @treinador = Treinador.new
  end

  # GET /treinadors/1/edit
  def edit
  end

  # POST /treinadors or /treinadors.json
  def create
    @treinador = Treinador.new(treinador_params)

    respond_to do |format|
      if @treinador.save
        format.html { redirect_to treinador_url(@treinador), notice: "Treinador was successfully created." }
        format.json { render :show, status: :created, location: @treinador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treinadors/1 or /treinadors/1.json
  def update
    respond_to do |format|
      if @treinador.update(treinador_params)
        format.html { redirect_to treinador_url(@treinador), notice: "Treinador was successfully updated." }
        format.json { render :show, status: :ok, location: @treinador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treinadors/1 or /treinadors/1.json
  def destroy
    @treinador.destroy

    respond_to do |format|
      format.html { redirect_to treinadors_url, notice: "Treinador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treinador
      # @treinador = Treinador.find_decoded(@current_user)
      @treinador = Treinador.first
    end

    # Only allow a list of trusted parameters through.
    def treinador_params
      params.require(:treinador).permit(:nome, :email, :password, :password_digest)
    end
end
