class Survey < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices
  has_many :reports, dependent: :destroy

  has_one_attached :photo

  validates :photo, attached: true

  validates :style, presence: true

  scope :published, -> { where(published: true) }
  scope :approved, -> { where(approved: true) }

  #                   0                1
  enum style: [:one_v_one_photo, :group_photo]

  def published!
    update(published: true)
  end

  def unpublished!
    update(published: false)
  end

  def approved!
    update(approved: true)
  end

  def unapproved!
    update(approved: false)
  end

  def total_votes
    votes.count
  end

  def controversy
    # Controversy is calculated based off two factors; vote count threshold and vote standard deviation

    # Comment this back in when you have a sizable amount of surveys and votes
    return false if votes.count < 2
    variance = vote_counts.reduce(0) { |variance, x| variance += (x - mean) ** 2 }
    sigma = Math.sqrt(variance/(vote_counts.size-1))

  end

  private

  def vote_counts
    choices.map(&:votes_count)
  end

  def mean
    vote_counts.reduce(:+) / vote_counts.length.to_f
  end
end
