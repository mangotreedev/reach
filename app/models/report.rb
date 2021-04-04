class Report < ApplicationRecord
  belongs_to :survey

  validates :reason, presence: true

  def self.options
    ['Spam or Scam', 'Abusive Content', 'Nudity or Pornography', 'Hate Speech or Symbols', 'Promotion of firearms or drugs', 'Intellectual Property Violation', 'Self Injury']
  end
end
