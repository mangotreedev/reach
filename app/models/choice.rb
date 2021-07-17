class Choice < ApplicationRecord
  belongs_to :survey
  has_many :votes, dependent: :destroy

  def percentage_of_vote
    votes.count.to_f / survey.total_votes
  end

  def votes_count
    votes.count
  end
end

# TODO: Make sure results page redirects if there are no votes yet
