class Vote < ApplicationRecord
  include ActionView::Helpers

  belongs_to :choice
  delegate :survey, to: :choice, allow_nil: true

  after_create :broadcast

  private

  def broadcast
    survey_data = survey.choices.map { |choice| choice.for_json }.to_h
    dashboard_data = { "survey_#{survey.id}": pluralize(survey.total_votes, 'vote') }

    ResultsChannel.broadcast_to(survey, survey_data)
    DashboardChannel.broadcast_to(survey.user, dashboard_data)
  end
end
