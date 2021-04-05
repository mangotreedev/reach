class ResultsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @survey = Survey.includes(:choices).find(params[:survey_id])
    authorize @survey
  end
end
