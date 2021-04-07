class ApprovalsController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    authorize @survey, policy_class: ApprovalPolicy
    @survey.approved!
    head :ok
  end
end
