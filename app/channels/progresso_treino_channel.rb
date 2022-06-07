class ProgressoTreinoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "progresso_treino_#{params[:id]}"
  end
end
