class Operador::HomeController < Operador::ApplicationController
  def index
    @pagamentos = Pagamento
    .where("prazo < ?", Time.zone.now)
    .joins(:cliente)
    .select([
      "pagamentos.id",
      "pagamentos.prazo",
      "pagamentos.cliente_id",
      "clientes.nome",
      "clientes.whatsapp"
    ])
  end

  def pagar
    pagamento = Pagamento.find(params[:id])
    respond_to do |format|
        format.js do
        if pagamento.update(prazo: pagamento.prazo + 1.month)
          render js: "
            document.getElementById('pagamento_#{pagamento.id}').remove();
          "
        else
          render js: "
            alert('Houve um erro ao tentar atualizar o status do pagamento');
          "
        end
      end
    end
  end
end