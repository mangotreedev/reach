class Survey < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices

  has_one_attached :photo

  validates :style, presence: true

  scope :published, -> { where(published: true) }
  scope :approved, -> { where(approved: true) }

  #                   0                1
  enum style: [:one_v_one_photo, :group_photo]

  def published!
    update(published: true)
  end

  def unapproved!
    update(approved: false)
  end

  def total_votes
    votes.count
  end
end
