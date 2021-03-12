class Choice < ApplicationRecord
  belongs_to :survey
  has_many :votes

  def percentage_of_vote
    votes.count.to_f / survey.total_votes
  end
end
