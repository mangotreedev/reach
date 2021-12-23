class Vote < ApplicationRecord
  belongs_to :choice
  delegate :survey, to: :choice, allow_nil: true

  after_create :broadcast_results

  private

  def broadcast_results
    survey_data = survey.choices.map { |choice| choice.for_json }.to_h
    dashboard_data = { "survey_#{survey.id}": survey.total_votes }

    ResultsChannel.broadcast_to(survey, survey_data)
    DashboardChannel.broadcast_to(survey.user, dashboard_data)
  end
end
