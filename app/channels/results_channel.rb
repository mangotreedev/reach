class ResultsChannel < ApplicationCable::Channel
  def subscribed
    survey = Survey.find(params[:id])
    stream_for survey
  end
end
