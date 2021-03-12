class ResultsController < ApplicationController
  def show
    @survey = Survey.includes(:choices).find(params[:survey_id])
    authorize @survey
  end
end
