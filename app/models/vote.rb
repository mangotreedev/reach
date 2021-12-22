class Vote < ApplicationRecord
  belongs_to :choice
  delegate :survey, to: :choice, allow_nil: true

  after_create :broadcast_results

  private

  def broadcast_results
    data = survey.choices.map { |choice| choice.for_json }.to_h
    ResultsChannel.broadcast_to(survey, data)
  end
end
