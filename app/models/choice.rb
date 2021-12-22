class Choice < ApplicationRecord
  belongs_to :survey
  has_many :votes, dependent: :destroy

  def percentage_of_vote
    percentage = votes.count.to_f / survey.total_votes
    percentage.nan? ? 0 : percentage
  end

  def votes_count
    votes.count
  end

  def for_json
    [ "choice_#{id}", percentage_of_vote ]
  end
end
