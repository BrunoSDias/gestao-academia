class Administrador::EnderecosController < Administrador::ApplicationController
  before_action :set_cliente
  before_action :set_endereco, only: %i[ show edit destroy update]

  def index
    @enderecos = Endereco
    .where(enderecos: { cliente_id: @cliente.id })
    .select(
      :id,
      :rua,
      :cep,
      :estado,
      :cidade,
      :complemento,
      :numero,
      :bairro
    )
  end

  # GET /enderecos/1 or /enderecos/1.json
  def show
  end

  # GET /enderecos/new
  def new
    @endereco = Endereco.new
  end

  # GET /enderecos/1/edit
  def edit
  end

  # POST /enderecos or /enderecos.json
  def create
    @endereco = Endereco.new(endereco_params)
    @endereco.cliente_id = @cliente.id

    respond_to do |format|
      if @endereco.save
        format.html { redirect_to administrador_cliente_endereco_url(@cliente, @endereco), notice: "Endereco was successfully created." }
        format.json { render :show, status: :created, location: @endereco }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enderecos/1 or /enderecos/1.json
  def update
    respond_to do |format|
      if @endereco.update(endereco_params)
        format.html { redirect_to administrador_cliente_endereco_url(@cliente, @endereco), notice: "Endereco was successfully updated." }
        format.json { render :show, status: :ok, location: @endereco }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1 or /enderecos/1.json
  def destroy
    @endereco.destroy

    respond_to do |format|
      format.html { redirect_to administrador_cliente_enderecos_url(@cliente), notice: "Endereco was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_cliente
      @cliente = Cliente.find(params[:cliente_id])
    end
    def set_endereco
      @endereco = Endereco.find(params[:id])
    end

  def endereco_params
    params[:endereco][:cep] = params[:endereco][:cep].gsub(/[^0-9\.]+/, '') if params[:endereco][:cep]
    params.require(:endereco).permit(:cliente_id, :rua, :cep, :estado, :cidade, :complemento, :numero, :bairro)
  end 
end
