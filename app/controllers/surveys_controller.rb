class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @surveys = policy_scope(Survey)
  end

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
    @survey = Survey.includes(:choices).find(params[:id])
    authorize @survey
  end

  def results

  end

  private

  def survey_params
    params.require(:survey).permit(:style, :photo)
  end
end
