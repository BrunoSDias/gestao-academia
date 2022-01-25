class OperadorsController < ApplicationController
  before_action :set_operador, only: %i[ show edit update destroy ]

  # GET /operadors or /operadors.json
  def index
    @operadors = Operador.all
  end

  # GET /operadors/1 or /operadors/1.json
  def show
  end

  # GET /operadors/new
  def new
    @operador = Operador.new
  end

  # GET /operadors/1/edit
  def edit
  end

  # POST /operadors or /operadors.json
  def create
    @operador = Operador.new(operador_params)

    respond_to do |format|
      if @operador.save
        format.html { redirect_to operador_url(@operador), notice: "Operador was successfully created." }
        format.json { render :show, status: :created, location: @operador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operadors/1 or /operadors/1.json
  def update
    respond_to do |format|
      if @operador.update(operador_params)
        format.html { redirect_to operador_url(@operador), notice: "Operador was successfully updated." }
        format.json { render :show, status: :ok, location: @operador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operadors/1 or /operadors/1.json
  def destroy
    @operador.destroy

    respond_to do |format|
      format.html { redirect_to operadors_url, notice: "Operador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operador
      @operador = Operador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operador_params
      params.require(:operador).permit(:nome, :email, :password, :password_digest, :administrador)
    end
end
