class ChoicesController < ApplicationController
  before_action :set_survey, only: [:new, :create]

  def new
    @choice = Choice.new
    @choice.survey = @survey
    authorize @choice
  end

  def create
    @choice = Choice.new(choice_params)
    @choice.survey = @survey
    authorize @choice
  end

  private

  def choice_params
    params.require(:choice).permit(:photo)
  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end
end
