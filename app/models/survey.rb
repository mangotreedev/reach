class Survey < ApplicationRecord
  belongs_to :user
  has_many :choices

  has_one_attached :photo

  validates :style, presence: true

  enum style: [:one_v_one_photo, :group_photo]
end
