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
    if @choice.save
      render json: {
        choice: render_to_string(partial: "pending", locals: { choice: @choice }, formats: :html)
      }
    else
      render json: { success: false, errors: choice.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @choice = Choice.find(params[:id])
    authorize @choice
    @choice.destroy
    redirect_to new_survey_choice_path(@choice.survey)
  end

  private

  def choice_params
    params.require(:choice).permit(:x, :y, :width, :height)
  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end
end
