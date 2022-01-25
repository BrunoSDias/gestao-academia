class ExerciciosController < ApplicationController
  before_action :set_exercicio, only: %i[ show edit update destroy ]

  # GET /exercicios or /exercicios.json
  def index
    @exercicios = Exercicio.all
  end

  # GET /exercicios/1 or /exercicios/1.json
  def show
  end

  # GET /exercicios/new
  def new
    @exercicio = Exercicio.new
  end

  # GET /exercicios/1/edit
  def edit
  end

  # POST /exercicios or /exercicios.json
  def create
    @exercicio = Exercicio.new(exercicio_params)

    respond_to do |format|
      if @exercicio.save
        format.html { redirect_to exercicio_url(@exercicio), notice: "Exercicio was successfully created." }
        format.json { render :show, status: :created, location: @exercicio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercicios/1 or /exercicios/1.json
  def update
    respond_to do |format|
      if @exercicio.update(exercicio_params)
        format.html { redirect_to exercicio_url(@exercicio), notice: "Exercicio was successfully updated." }
        format.json { render :show, status: :ok, location: @exercicio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercicios/1 or /exercicios/1.json
  def destroy
    @exercicio.destroy

    respond_to do |format|
      format.html { redirect_to exercicios_url, notice: "Exercicio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercicio
      @exercicio = Exercicio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercicio_params
      params.require(:exercicio).permit(:treino_id, :nome, :descricao)
    end
end
