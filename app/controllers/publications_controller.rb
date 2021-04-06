class PublicationsController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    authorize @survey, policy_class: PublicationPolicy
    if @survey.choices.any?
      @survey.published!
      redirect_to @survey
    else
      flash[:info] = "You must provide choices before publishing"
      redirect_to new_survey_choice_path(@survey)
    end
  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    authorize @survey, policy_class: PublicationPolicy

    @survey.update(published: false);
    render json: { head: :no_content }
  end
end
