module Treinador::AndamentoExerciciosHelper
  def verifica_estilo_por_status(andamento_exercicio)
      if andamento_exercicio.nao_realizado?
        return "style='background-color: #ff9595'".html_safe
      elsif andamento_exercicio.em_andamento?
        return "style='background-color: yellow'".html_safe
      elsif andamento_exercicio.realizado?
        return "style='background-color: #8bf96a'".html_safe
      end
  end
end
