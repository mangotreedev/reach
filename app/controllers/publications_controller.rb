class PublicationsController < ApplicationController
  before_action :set_and_authorize_publication

  def create
    if @survey.choices.any?
      @survey.published!
      flash[:sweetalert] = "Share your photo with friends by pressing the blue arrow button"
      redirect_to @survey
    else
      flash[:sweetalert] = "You must provide choices before publishing"
      redirect_to new_survey_choice_path(@survey)
    end
  end

  def destroy
    @survey.unpublished!;
    render json: { head: :no_content }
  end

  private

  def set_and_authorize_publication
    @survey = Survey.find(params[:survey_id])
    authorize @survey, policy_class: PublicationPolicy
  end
end
