class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    authorize @survey
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    authorize @survey
    if @survey.save
      redirect_to new_survey_choice_path(@survey)
    else
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
    authorize @survey
  end

  private

  def survey_params
    params.require(:survey).permit(:style, :photo)
  end
end
