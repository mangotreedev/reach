class Vote < ApplicationRecord
  belongs_to :choice
  delegate :survey, to: :choice, allow_nil: true

  after_create :broadcast_results

  private

  def broadcast_results

  end
end
