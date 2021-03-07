class Survey < ApplicationRecord
  belongs_to :user
  has_many :choices

  has_one_attached :photo
end
