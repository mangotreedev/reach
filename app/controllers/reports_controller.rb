class ReportsController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    survey = Survey.find(params[:survey_id])
    report = Report.create(report_params.merge(survey: survey))

    survey.unapproved!
    authorize report

    flash[:sweetalert] = "Thank you for your report, our team is investigating now."
    redirect_to root_path
  end

  private

  def report_params
    params.require(:report).permit(:reason)
  end
end
