class PublicationsController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    @survey.published!
    authorize @survey
    redirect_to @survey
  end
end
