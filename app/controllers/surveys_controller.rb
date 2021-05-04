class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @surveys = policy_scope(Survey)
    case params[:filter]
    when "most"
      @surveys = @surveys.select(&:controversy).sort_by(&:controversy).first(20)
    when "least"
      @surveys = @surveys.select(&:controversy).sort_by(&:controversy).reverse!.first(20)
    when "new"
      @surveys = @surveys.order(:created_at)
    when "votes"
      @surveys = @surveys.sort_by(&:total_votes).reverse!
    when "couple"
      @surveys = @surveys.where(style: :one_v_one_photo)
    when "group"
      @surveys = @surveys.where(style: :group_photo)
    end
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

  def destroy
    @survey = Survey.find(params[:id])
    authorize @survey
    @survey.destroy!
    head :no_content
  end

  private

  def survey_params
    params.require(:survey).permit(:style, :photo)
  end
end
