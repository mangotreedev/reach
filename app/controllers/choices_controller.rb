class ChoicesController < ApplicationController
  before_action :set_survey, only: [:new, :create]

  def new
    @choice = Choice.new
    @choice.survey = @survey
    authorize @choice
  end

  def create
    @choice = Choice.new(choice_params)
    binding.pry
    @choice.survey = @survey
    authorize @choice
    if @choice.save
      render json: { success: true }
    else
      render json: { success: false, errors: choice.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:photo)
  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end
end
