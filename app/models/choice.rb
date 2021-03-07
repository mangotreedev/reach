class Choice < ApplicationRecord
  belongs_to :survey
  has_many :votes

  has_one_attached :photo
end
